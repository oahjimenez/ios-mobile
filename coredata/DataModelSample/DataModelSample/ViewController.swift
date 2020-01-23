//
//  ViewController.swift
//  DataModelSample
//
//  Created by user164457 on 1/22/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var persons: [Person] = []

    @IBOutlet var personTableView: UITableView!
    var fetchResultController : NSFetchedResultsController<Person>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personTableView.delegate = self
        self.personTableView.dataSource = self

        let addPersonButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(formView))
        self.navigationItem.rightBarButtonItem = addPersonButton
        // Do any additional setup after loading the view.
        self.loadDataBase()
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.personTableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = self.persons[indexPath.row].name
        cell.detailTextLabel?.text = self.persons[indexPath.row].rut
        return cell
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.personTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
                self.personTableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            self.personTableView.deleteRows(at: [indexPath!], with: .automatic)
        case .move:
            self.personTableView.moveRow(at: indexPath!, to: newIndexPath!)
        case .update:
            self.personTableView.reloadRows(at: [indexPath!], with: .automatic)
        @unknown default:
            break
        }
        self.persons = controller.fetchedObjects as! [Person]
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.personTableView.endUpdates()
    }
}

extension ViewController {
    @objc func formView() {
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "addpersonform", sender: self)
        }
    }
    
    func loadDataBase() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetch : NSFetchRequest<Person> = Person.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key:"name",ascending:true)]
        self.fetchResultController = NSFetchedResultsController(fetchRequest: fetch, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.fetchResultController.delegate = self
        
        do {
            try fetchResultController.performFetch()
            self.persons = fetchResultController.fetchedObjects!
            DispatchQueue.main.async {
                self.personTableView.reloadData()
            }
            
        } catch let error as NSError {
            print("Error al cargar los datos ",error.localizedDescription)
        }
    }
    
    @IBAction func homeVC(segue:UIStoryboardSegue) {
    
    }
    
    @objc func addNewPerson() {
        
        let form = UIAlertController(title: "Registro de Personas", message: "Completas todos los campos para continuar",  preferredStyle: .alert)
        form.addTextField{ (text) in
            text.placeholder = "Nombre"
            text.keyboardAppearance = .dark
            text.keyboardType = .default
            text.autocorrectionType = .yes
            text.autocapitalizationType = .words
        }
        form.addTextField{ (text) in
            text.placeholder = "Rut"
            text.keyboardAppearance = .dark
            text.keyboardType = .default
            text.autocorrectionType = .yes
            text.autocapitalizationType = .words
        }
        
        form.addAction(UIAlertAction(title:"Cancelar", style: .cancel,handler: nil))
        form.addAction(UIAlertAction(title:"Guardar",style: .default,handler: { (action) in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let person = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "Person", in: context)!,insertInto: context)
            person.setValue(form.textFields![0].text, forKey: "name")
            person.setValue(form.textFields![1].text, forKey: "rut")
            
            do {
                try context.save()
                print("registro guardado en CoreData")
            } catch let errorSave as NSError {
                print("No guardo el registro en CoreData: ",errorSave.localizedDescription)
            }
                    }))
        self.present(form,animated: true, completion: nil)
    }
    
}
