//
//  FirstViewController.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/20.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectActionBtn(_ sender: UIButton) {
        let network = SocketIOManager()
        network.establishConnection()
    }
    
    @IBAction func disConnectedActionBtn(_ sender: UIButton) {
        SocketIOManager.shared.closeConnection()
    }
    
    @IBAction func sendMessageActionBtn(_ sender: UIButton) {
        SocketIOManager.shared.sendMessage(message: text1.text!, nickname: text2.text!)
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
