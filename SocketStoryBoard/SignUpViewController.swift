//
//  SignUpViewController.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/17.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import UIKit
import SocketIO

class SignUpViewController: UIViewController, SignUpCheckProtocol {

    func downloadData(items: String){
       print("값좀제발:", items)
        receivedProtocolData = items
       
    }
    
    @IBOutlet weak var signUpActionBtnBottom: NSLayoutConstraint!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var receivedProtocolData = ""
    var socketIoManager = SocketIOManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if socketIoManager.establishConnection(receivedNum: 0) == true {
            let resultAlert = UIAlertController(title: "결과", message: "서버에 접속되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
        
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)

        NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    @objc private func keyboardWillShow(notification: Notification) {
        self.signUpActionBtnBottom.constant = 270
        
    }

    @objc private func keyboardWillHide(notification: Notification) {
        self.signUpActionBtnBottom.constant = 20
        
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
        
    }
    
    @IBAction func signUpActionBtn(_ sender: UIButton) {
        if idTextField.text == "" || pwTextField.text == "" || nameTextField.text == "" {
            let resultAlert = UIAlertController(title: "결과", message: "Id, Pw, Name에 공란이 있습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true, completion: nil)
            
        }else {
            socketIoManager.register(id: idTextField.text!, pw: pwTextField.text!, name: nameTextField.text!)
            
            print("흐름1")
            print("리시브1:", receivedProtocolData)
            print("흐름2")
            if receivedProtocolData == "200" {
            let resultAlert = UIAlertController(title: "성공", message: "로그인 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
           }
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
