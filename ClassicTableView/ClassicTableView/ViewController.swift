//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Anupama Singh on 1/28/22.
//

import UIKit
/*
 1.Add a table view to the story board
 2.Add a table view cell to the tavle view
 3.Create identifier for table view cell and call it "cell"
 4.Create outlet of tableview to the code cell the table view as "tblView"
 5.Add Protocals UITableViewDelegate, UITableViewDataSource to the class
 6.Add functions for table view numberOfRowInSection and cellForRowAt
 7.In view did load add tblView.delegate
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    let arr = ["Mark", "Bill", "Peter", "John","Tom"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    

   


}

