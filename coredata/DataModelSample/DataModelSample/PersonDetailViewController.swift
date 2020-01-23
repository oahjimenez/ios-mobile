//
//  PersonDetailViewController.swift
//  DataModelSample
//
//  Created by user164457 on 1/22/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension PersonDetailViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "personDetailCell", for: indexPath)
        return cell
    }
    
    
}
