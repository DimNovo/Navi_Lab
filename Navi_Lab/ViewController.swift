//
//  ViewController.swift
//  Navi_Lab
//
//  Created by Dmitry Novosyolov on 09/01/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Result {
        case done
        case userName
        case password
    }
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "LogIn":
            guard !(userPasswordField.text?.isEmpty)!,
                  !(userPasswordField.text?.isEmpty)!
                else {return}
            resultDisplay(result: .done)
        case "ForgotName":
            resultDisplay(result: .userName)
        case "ForgotPassword":
            resultDisplay(result: .password)
        default:
            break
        }
     }
    
    func resultDisplay(result: Result) {
        switch result {
        case .done:
            navigationItem.title = "User: \(userNameField.text!) Password: \(userPasswordField.text!)"
            navigationItem.prompt = "You a Log In!"
        case .userName:
            navigationItem.title = "Forgot User Name!"
        case .password:
            navigationItem.title = "Forgot Password!"
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        navigationItem.title?.removeAll()
        navigationItem.prompt?.removeAll()
        userNameField.text?.removeAll()
        userPasswordField.text?.removeAll()
    }
}

