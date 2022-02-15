//
//  ViewController.swift
//  Assignment3First
//
//  Created by Anupama Singh on 2/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    
    
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC"{
            let secondVC = segue.destination as! SecondViewController
            secondVC.name = (textFirstName.text ?? "") + " " + (textLastName.text ?? "")
        }
    }
    
 

}

