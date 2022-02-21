//
//  GetNameViewController.swift
//  Assignment4
//
//  Created by Anupama Singh on 2/20/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText : String)
}

class GetNameViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    var sendFirstAndLastNameDelegate: SendFirstAndLastNameDelegate?
    var sendMessageDelegate: SendMessageDelegate?

    @IBOutlet weak var textFirstName: UITextField!
    
    @IBOutlet weak var textLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveName(_ sender: Any) {
        guard let first = textFirstName.text else {return}
        guard let last = textLastName.text else {return}
        
        sendMessageDelegate?.sendMessage(message: "Welcome \(first), \(last)")
        self.navigationController?.popViewController(animated: true)
    }
    
}
