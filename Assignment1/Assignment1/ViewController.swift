//
//  ViewController.swift
//  Assignment1
//
//  Created by Anupama Singh on 1/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        let firstName = txtFirstName.text ?? ""
        let lastName = txtLastName.text ?? ""
        lblName.text = "Hello " + firstName + " " + lastName
    }
    
}

