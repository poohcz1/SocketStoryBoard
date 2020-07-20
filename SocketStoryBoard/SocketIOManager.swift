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
    
    static let shared = SocketIOManager()
//    var manager = SocketManager(socketURL: URL(string: "https://knowledgetalk.co.kr:7051/SignalServer")!, config: [.log(true), .compress])
    var manager = SocketManager(socketURL: URL(string: "https://knowledgetalk.co.kr:7101")!, config: ["log": true,
    "compress": true,
    "forcePolling": true,
    "forceNew": true])
    var socket: SocketIOClient!
    
    struct chatType {
        var type = -1
        var message = ""
    }
    
    override init() {
         print("흐름2")
        super.init()
         print("흐름3")
        socket = self.manager.socket(forNamespace: "/SignalServer")
         print("흐름4")
        socket.on("test") { dataArray, ack in
            print("흐름5")
            print(dataArray)
        }
    }

    func establishConnection() {
         print("흐름6")
        socket.connect()
         print("흐름7")
        
    }
    
    func closeConnection() {
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
    
//    func bindMsg(){
//        self.socket.on("test") {(dataArray, socketAck)
//
//        }
//    }
}

