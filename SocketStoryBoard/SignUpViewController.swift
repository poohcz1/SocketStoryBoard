//
//  SignUpViewController.swift
//  SocketStoryBoard
//
//  Created by kp_mac on 2020/07/17.
//  Copyright © 2020 kp_mac. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, SignUpCheckProtocol {
    
    @IBOutlet weak var signUpActionBtnBottom: NSLayoutConstraint!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var receivedData: NSArray = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func downloadData(items: NSArray) {
        receivedData = items
        print("리시브:", receivedData)
    }
    
    
    @IBAction func signUpActionBtn(_ sender: UIButton) {
        if idTextField.text == "" || pwTextField.text == "" || nameTextField.text == "" {
            let resultAlert = UIAlertController(title: "결과", message: "Id, Pw, Name에 공란이 있습니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true, completion: nil)
        }else {
            let signUpNetwork = Network()
            signUpNetwork.signUpSocket(id: idTextField.text!, pw: pwTextField.text!, name: nameTextField.text!)
            
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
