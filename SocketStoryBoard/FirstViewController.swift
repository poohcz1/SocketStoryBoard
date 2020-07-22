//
//  FirstViewController.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/20.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import UIKit
import SocketIO

class FirstViewController: UIViewController {
   
    let socketIoManager = SocketIOManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectActionBtn(_ sender: UIButton) {
       
    }
    
    @IBAction func disConnectedActionBtn(_ sender: UIButton) {
        if socketIoManager.establishConnection(receivedNum: 1) == false {
            let resultAlert = UIAlertController(title: "결과", message: "서버를 종료합니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
