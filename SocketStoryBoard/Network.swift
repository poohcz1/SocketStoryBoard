//
//  Network.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/16.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import Foundation
import Alamofire
import SocketIO

class Network:NSObject{
    
    var manager = SocketManager(socketURL: URL(string: "https://knowledgetalk.co.kr:7101")!, config: ["log": true,
    "compress": true,
    "forcePolling": true,
    "forceNew": true])
    var socket: SocketIOClient!
    static let shared = SocketIOManager()
    
    override init() {
        super.init()

    }
    
    func connetion() {
          print("흐름6")
         socket.connect()
          print("흐름7")
         
     }
     
     func disConnected() {
          print("흐름8")
         socket.disconnect()
          print("흐름9")
     }
    
     func sendMessage(message: String, nickname: String) {
          print("흐름10")
         socket.emit("knowledgetalk",  ["message" : "This is a test message"])
         socket.emit("event1", [["name" : "ns"], ["em/Users/kp_mac/Downloads/아카이브 2/final/final/final/final/ParentInsertModel.swiftail" : "@naver.com"]])
         socket.emit("event2", ["name" : "ns", "email" : "@naver.com"])
         socket.emit("msg", ["nick": nickname, "msg" : message])
         
     }
    

//    var delegate: SignUpCheckProtocol!
    
    

    
    
    func signUpSocket(id: String, pw: String, name: String){
        
}










//
//    func signUpSocket(id: String, pw: String, name: String){
//
//        struct param: Codable{
//            var eventOp: String?
//            var reqNo: String?
//            var reqDate: String?
//            var userId: String?
//            var userPw: String?
//            var userName: String?
//        }
//
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
//        let urlAdd = param(eventOp: "SignUp", reqNo: "1234567", reqDate: "20190603123015", userId: id, userPw: pw, userName: name)
//        let jsonData = try? encoder.encode(urlAdd)
//        if jsonData == jsonData, let jsonString = String(data: jsonData!, encoding: .utf8){
//            print(jsonString)
//        }
////
////        print("옴?")
////        var jsonURLString: String = "https://knowledgetalk.co.kr:7101/web.signup.js"
////        print("옴?2")
//////        let urlAdd = param.self
////        jsonURLString = jsonURLString + urlAdd
////        jsonURLString = jsonURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
////        let completeURL: URL = URL(string: jsonURLString)!
////        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
////
////        print("주소:", completeURL)
////
////        let task = defaultSession.dataTask(with: completeURL){(data, response, error) in
////            if error != nil{
////                print("Failed to check data")
////
////            }else{
////                self.parseJSON(data!)
////                print("Data is checked!")
////
////            }
////        }
////        task.resume()
////
////
//////            socket.on("currentAmount") {data, ack in
//////                guard let cur = data[0] as? Double else { return }
//////         print("흐름2")
//////                self.socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
//////                    self.socket.emit("update", ["amount": cur + 2.50])
//////                     print("흐름3")
//////                }
//////         print("흐름4")
//////                ack.with("Got your currentAmount", "dude")
//////            }
////
////
////    }
////
////    func parseJSON(_ data: Data){
////        print("안왔지?")
////        var jsonResult = NSArray()
////
////        do{
////            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
////        }catch let error as NSError{
////            print(error)
////        }
////
////        var jsonElement = NSDictionary()
////        let locations = NSMutableArray()
////
////        for i in 0..<jsonResult.count{
////            jsonElement = jsonResult[i] as! NSDictionary
////            let query = Model()
////
////            if let eventOp = jsonElement["eventOp"] as? String,
////                let reqNo = jsonElement["reqNo"] as? String,
////                let code = jsonElement["code"] as? String,
////                let message = jsonElement["message"] as? String,
////                let resDate = jsonElement["resDate"] as? String {
////
////                query.eventOp = eventOp
////                query.reqNo = reqNo
////                query.code = code
////                query.message = message
////                query.resDate = resDate
////
////                print("2222", jsonElement)
////            }
////            locations.add(query)
////            print("1111", jsonElement)
////        }
////
////        DispatchQueue.main.async(execute: {() -> Void in
////            self.delegate.downloadData(items: locations)
////        })
////    }
//}
//
//
}
