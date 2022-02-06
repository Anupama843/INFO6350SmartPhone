//
//  ViewController.swift
//  Assignment2
//
//  Created by Anupama Singh on 2/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images: [[String: String]] = [["name": "appleJuice", "title": "Apple Juice"],
                  ["name": "biryani", "title": "Briyani"],
                  ["name": "cake", "title": "Cake"],
                  ["name": "cocktail", "title": "CockTail"],
                  ["name": "hamburger", "title": "Hamburger"],
                  ["name": "Karaage", "title": "Karaage"],
                  ["name": "kimchi-fried", "title": "Kimchi-Fried"],
                  ["name": "paneer", "title": "Paneer"],
                  ["name": "rolls", "title": "Chicken Roll"],
                  ["name": "sushi", "title": "Sushi"]]
                    
    
    
//    let images = ["appleJuice", "biryani", "cake", "cocktail", "hamburger", "Karaage", "kimchi-fried", "paneer", "rolls", "sushi"]
//    let imageNames = ["Apple Juice", "Briyani", "Cake", "CockTail", "Hamburger", "Karaage", "Kimchi-Fried", "Paneer", "Chicken Roll", "Sushi"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as!TableViewCell
        cell.imageViewCell.image = UIImage(named: images[indexPath.row]["name"]!)
        cell.labelCell.text = images[indexPath.row]["title"]
        return cell;
    }
    


}

