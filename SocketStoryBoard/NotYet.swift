////
////  NotYet.swift
////  SocketStoryBoard
////
////  Created by kp_mac on 2020/07/17.
////  Copyright © 2020 kp_mac. All rights reserved.
////
//
//import Foundation
////
////  ViewController.swift
////  SocketStoryBoard
////
////  Created by kp_mac on 2020/07/16.
////  Copyright © 2020 kp_mac. All rights reserved.
////
//// https://medium.com/mindful-engineering/sockets-mvvm-in-swift-8f32b1401aa5
//// https://socket.io/get-started/chat/
//// https://nsios.tistory.com/30
//// https://www.youtube.com/watch?v=ho0sk-aLAB4
//// https://www.youtube.com/watch?v=JB2MdcY1MKs
//// https://github.com/socketio/socket.io
//
//import UIKit
//import SocketIO
//import Alamofire
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var textField: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//         print("흐름1")
//        // Do any additional setup after loading the view.
//    }
//    
//    @IBAction func disconnetSocket(_ sender: UIButton) {
//         print("흐름11")
//        SocketIOManager.shared.closeConnection()
//    }
//    
//    @IBAction func connectSocket(_ sender: UIButton) {
//         print("흐름12")
//        
//        SocketIOManager.shared.establishConnection()
//    }
//    
//    @IBAction func sendData(_ sender: UIButton) {
//         print("흐름13")
//        SocketIOManager.shared.sendMessage(message: self.textField.text!, nickname: "ns")
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
////    @IBAction func conActionBtn(_ sender: UIButton) {
////        //접근하고자 하는 URL 정보
////        let URL = "https://106.240.247.44:7101/SignalServer"
////        //전송할 파라미터 정보
////        let PARAM:Parameters = [
////            //"축구선수" 혹은 "영화배우"를 넣어주세요.
////            "JOB": "영화배우"
////        ]
////        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
////        let alamo = AF.request(URL, method: .post, parameters: PARAM).validate(statusCode: 200..<300)
////        //결과값으로 JSON을 받을 때 사용
////        alamo.responseJSON() { response in
////            switch response.result
////            {
////            //통신성공
////            case .success(let value):
////
////                if let jsonObj = value as? [Dictionary<String, Any>]
////                {
////                    //JSON 배열의 갯수
////                    print("데이터의 갯수: \(jsonObj.count)")
////
////                    for item in jsonObj
////                    {
////                        print("\n--------------------------------------------")
////                        //JSON 배열의 n번째 값
////                        print("item: \(item)")
////
////                        //JSON의 단일 값 접근
////                        let NAME = item["NAME"]! as? String ?? ""
////                        let BORN = item["BORN"]! as? Int ?? 0
////                        let JOB = item["JOB"]! as? String ?? ""
////
////                        print("NAME: \(NAME)")
////                        print("BORN: \(BORN)")
////                        print("JOB: \(JOB)")
////                    }
////                }
////
////            //통신실패
////            case .failure(let error):
////                print("error: \(String(describing: error.errorDescription))")
////            }
////        }
////
////    }
//}
//
//
