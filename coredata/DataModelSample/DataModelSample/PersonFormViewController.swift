//
//  PersonFormViewController.swift
//  DataModelSample
//
//  Created by user164457 on 1/22/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit
import CoreData

class PersonFormViewController: UIViewController {
    @IBOutlet var rutTextField: UITextField!
    
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageInteraction(_:)))
        self.imageView.addGestureRecognizer(tap)
        self.imageView.layer.borderColor = UIColor.blue.cgColor
        self.imageView.layer.borderWidth = 2.0
        self.imageView.layer.cornerRadius = self.imageView.frame.width*0.5
        self.nameTextField.delegate = self
        self.rutTextField.delegate = self
        self.submitButton.addTarget(self, action: #selector(self.save), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension PersonFormViewController:UITextFieldDelegate {
    
    @objc func imageInteraction(_ sender: UITapGestureRecognizer) {
        if sender.numberOfTouches == 1 {
            print("Un tap")
        } else if sender.numberOfTouches == 2 {
            print("Dos tap")
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.nameTextField:
            self.rutTextField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
        return true
    }
    
    @objc func save() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let person = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "Person", in: context)!,insertInto: context)
        person.setValue(self.nameTextField.text, forKey: "name")
        person.setValue(self.rutTextField.text, forKey: "rut")
        
        do {
            try context.save()
            print("registro guardado en CoreData")
            self.performSegue(withIdentifier: "backtohome", sender: self)
        } catch let errorSave as NSError {
            print("No guardo el registro en CoreData: ",errorSave.localizedDescription)
        }
    }
    
}
