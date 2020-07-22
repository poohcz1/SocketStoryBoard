//
//  SocketIOManager.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/17.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import Foundation
import SocketIO

protocol SignUpCheckProtocol: class {
    func downloadData(items: String)
}

class SocketIOManager: NSObject {
    
    var delegate: SignUpCheckProtocol!
    var manager: SocketManager?
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        self.manager = SocketManager(socketURL: URL(string: "http://106.240.247.44:7605")!, config: [.log(true), .reconnects(true), .forceWebsockets(true)])
    }

    func establishConnection(receivedNum: Int) -> Bool{

        socket = self.manager?.defaultSocket
        socket = self.manager?.socket(forNamespace: "/SignalServer")
        
        socket.on("knowledgetalk"){data, ack in
            print("decodeJson", data)
            var code = ""
            let fixData = data as NSArray
            print("aaaaa",fixData)
            var jsonElment = NSDictionary()
            let item = NSMutableArray()
            for i in 0..<fixData.count{
                jsonElment = fixData[i] as! NSDictionary
                let model = Model()
                if let eventOp = jsonElment["eventOp"] as? String,
                let reqNo = jsonElment["reqNo"] as? String,
                let code = jsonElment["code"] as? String,
                let message = jsonElment["message"] as? String,
                let resDate = jsonElment["resDate"] as? String {
                    
                    model.eventOp = eventOp
                    model.reqNo = reqNo
                    model.code = code
                    model.message = message
                    model.resDate = resDate
                }
                item.add(model)
                print("cccc",item)
                
                for i in 0..<item.count{
                    let dontknow: Model = item[i] as! Model
                    code = String(dontknow.code!)
                }
                print("code:", code)
            }
            self.delegate?.downloadData(items: code)

        }
        
        socket.on(clientEvent: .error){data, ack in
            print("Socket Error")
            
        }
        
        socket.on(clientEvent: .connect){data, ack in
            print("Socket is connectd!")
            
        }
        
        socket.on(clientEvent: .reconnect){data, ack in
            print("Socket reconnect")
            
        }
        
        socket.on(clientEvent: .disconnect){data, ack in
            print("Socket is disconnected")
            
        }
        
        if receivedNum == 0 {
            socket.connect()
            
            return true
        }else if receivedNum == 1{
            
        }
        
        return false
    }
    
    func addHandlers(){
        
    }
   
    func register(id: String, pw: String, name: String) {
        let registerModel: [String: Any] = [
            "eventOp": "Register",
            "reqNo": "1234567",
            "reqDate": getDate(),
            "userId": id,
            "userPw": pw,
            "userName": name,
            "deviceType": "IOS"
        ]
        
        let sendData = encodeForJson(inputData: registerModel)
        socket.emit("knowledgetalk", sendData as! SocketData) // 모르겠다 찾아볼 것.
        
    }

    func encodeForJson(inputData: [String: Any]) -> Any{
        
       do {
            let jsonData = try JSONSerialization.data(withJSONObject: inputData, options: [])
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            let temp = jsonString.data(using: .utf8)!
            let jsonObject = try JSONSerialization.jsonObject(with: temp, options: .allowFragments)
            
            print("jsonobject", jsonObject)
            return jsonObject
            
        } catch {
            return 0 // 왜 0으로 했을까
        }
    }
    
    func getDate() -> String {
        let today = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateString = formatter.string(from: today)

        return dateString
    }
}


