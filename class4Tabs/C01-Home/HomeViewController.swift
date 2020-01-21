//
//  HomeViewController.swift
//  class4Tabs
//
//  Created by user164457 on 1/16/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(color), name: NSNotification.Name(rawValue:"ok"), object: nil)
        super.viewDidLoad()
        button.shadow(shadowColorPorcent: 0.3)

        // Do any additional setup after loading the view.
        LocationService.shared.permission { (status) in
            if !status {
                LocationService.shared.manager.requestWhenInUseAuthorization()
            }
        }
        if UserDefaults.standard.bool(forKey: "Logged"){
            print("Login exitoso")
        } else {
            BiometricsService.shared.access(text: "Transferir", completion: { (access) in
                print("Transferir access:",access)
                if access {
                    UserDefaults.standard.set(true,forKey: "Logged")
                } else {
                    let alert = UIAlertController(title: "Usuario no identificado", message : "Lo sentimos no logramos validar tu identidad, intenta nuevamente",preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title:"OK",style: .default,handler:nil))
                    DispatchQueue.main.async {
                        self.present(alert,animated:true,completion:nil)
                    }
                }
            })
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func color(){
        DispatchQueue.main.async {
            self.view.backgroundColor = .red
        }
    }

}
