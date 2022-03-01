//
//  StockViewController.swift
//  Assignment5
//
//  Created by Anupama Singh on 2/27/22.
//

import UIKit
import SwiftSpinner
import Alamofire
import SwiftyJSON

class StockViewController: UIViewController {

    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var ratingScoreLabel: UILabel!
    @IBOutlet weak var ratingRecommendationLabel: UILabel!
    @IBAction func getRatingButtonAction(_ sender: Any) {
        guard let companySymbol = companyNameTextField.text, !companySymbol.isEmpty else {
            showAlert(title: "Invalid Input", message: "Please enter company code")
            return
        }
        let url = "\(companyRateURL)\(companySymbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        SwiftSpinner.show("Get rating and recommendation for \(companySymbol)")
        AF.request(url).validate().responseDecodable(of: [Rating].self)  { response in
            SwiftSpinner.hide(nil)
            if let rating = response.value?.first {
                self.ratingScoreLabel.text! += (" \(rating.ratingScore)")
                self.ratingRecommendationLabel.text! += (" \(rating.ratingRecommendation)")
                return
            }
            if let error = response.error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
 
