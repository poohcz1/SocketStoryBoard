//
//  Model.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/16.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import Foundation

class Model: NSObject {
    var eventOp: String?
    var reqNo: String?
    var code: String?
    var message: String?
    var resDate: String?
        
    override init() {
        
    }
    
    init(eventOP: String, reqNo: String, code: String, message: String, resDate: String) {
        self.eventOp = eventOP
        self.reqNo = reqNo
        self.code = code
        self.message = message
        self.resDate = resDate
    }
}
