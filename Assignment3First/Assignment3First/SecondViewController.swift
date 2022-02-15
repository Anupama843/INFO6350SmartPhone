//
//  SecondViewController.swift
//  Assignment3First
//
//  Created by Anupama Singh on 2/13/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWelcome.text = "Welcome! \(name)"
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
