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

    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectActionBtn(_ sender: UIButton) {
        let socketIoManager = SocketIOManager()
        socketIoManager.establishConnection()
        
    }
    
    @IBAction func disConnectedActionBtn(_ sender: UIButton) {
       let socketManager = SocketIOManager()
        socketManager.establishConnection()
    }
    
    @IBAction func sendMessageActionBtn(_ sender: UIButton) {
        let socketManager = SocketIOManager()
        socketManager.establishConnection()
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
