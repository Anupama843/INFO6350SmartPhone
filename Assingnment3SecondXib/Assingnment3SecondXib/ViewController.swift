//
//  ViewController.swift
//  Assingnment3SecondXib
//
//  Created by Anupama Singh on 2/13/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images: [Image] = [Image(name: "appleJuice", title: "Apple Juice"),
                            Image(name: "biryani", title: "Briyani"),
                            Image(name: "cake", title: "Cake"),
                            Image(name: "cocktail", title: "CockTail"),
                            Image(name: "hamburger", title: "Hamburger"),
                            Image(name: "Karaage", title: "Karaage"),
                            Image(name: "kimchi-fried", title: "Kimchi-Fried"),
                            Image(name: "paneer", title: "Paneer"),
                            Image(name: "rolls", title: "Chicken Roll"),
                            Image(name: "sushi", title: "Sushi")];
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image =  UIImage(named: images[indexPath.row].name)
        cell.lblImage.text = images[indexPath.row].title
        return cell
    }
    

    struct Image {
        let name: String
        let title: String
    }
}

