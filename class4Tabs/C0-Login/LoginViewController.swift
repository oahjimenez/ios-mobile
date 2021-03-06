//
//  LoginViewController.swift
//  class4Tabs
//
//  Created by user164457 on 1/17/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: Any) {
        if let username = self.usernameTextField.text,let password = self.passwordTextField.text {
            if username.isEmpty || password.isEmpty {
                sendAlert("Log in error", "Por favor ingrese su usuario y contreaseña","Ok")
                return
            }
            
            AuthentificationService.shared.authenticate(username:username,password:password,completion: {(isAuthenticated) in
                if isAuthenticated {
                    self.sendAlert("Bienvenido, \(username)", "Has ingresado satisfactoriamente","Ok")
                    self.performSegue(withIdentifier: "logintohome", sender: self)
                } else {
                    self.sendAlert("Error de autenticacion", "Usuario o contraseña incorretos","Ok")
                }
                
            })
        }
        

    }
    
    
    func sendAlert(_ title:String,_  message:String,_ actionTitle:String) {
        let alert = UIAlertController(title: title, message : message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:actionTitle,style: .default,handler:nil))
        DispatchQueue.main.async {
            self.present(alert,animated:true,completion:nil)
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
    
    /*
     Ejemplo sobre como compartir informacion entre distintos viewController, utilizando bus de eventos
     */
    @objc func touch() {
    NotificationCenter.default.post(name:NSNotification.Name(rawValue:"ok"), object: nil)
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "", sender: self)
        }
    }

}
