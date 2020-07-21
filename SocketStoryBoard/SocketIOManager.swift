//
//  SocketIOManager.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/17.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import Foundation
import SocketIO
import Alamofire

class SocketIOManager: NSObject {
    
//    static let shared = SocketIOManager()
    var manager: SocketManager?
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        self.manager = SocketManager(socketURL: URL(string: "http://106.240.247.44:7605")!, config: [.log(true), .reconnects(true), .forceWebsockets(true)])
    }


    func establishConnection() {
        socket = self.manager?.defaultSocket
        socket = self.manager?.socket(forNamespace: "/SignalServer")
        
        socket.on("knowledgetalk"){data, ack in
            print("데이터", data)
        }
        
        socket.on(clientEvent: .error){data, ack in
            print("에러", data)
            
        }
        
        socket.on(clientEvent: .connect){data, ack in
            print("연결", data)
            
        }
        
        socket.on(clientEvent: .reconnect){data, ack in
            print("재연결", data)
            
        }
        
        socket.on(clientEvent: .disconnect){data, ack in
            print("재연결", data)
            
        }
        socket.connect()
    }
    
    func addHandlers(){
        
    }

   
    func sendMessage() {
        
        let sample: [String: Any] = [
            "eventOp": "Register",
            "reqNo": "12213123",
            "reqDate": "20200720213012"
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: sample, options: [])
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            
            socket.emit("knowledgetalk", jsonString)
            
        } catch {
            
        }
        print(sample)

        
    }

}
