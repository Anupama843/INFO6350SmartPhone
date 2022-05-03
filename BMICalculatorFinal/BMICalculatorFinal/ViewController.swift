//
//  ViewController.swift
//  BMICalculatorFinal
//
//  Created by Anupama Singh on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightSegemntControl: UISegmentedControl!
    
    @IBOutlet weak var weightSegemntControl: UISegmentedControl!
    
    @IBOutlet weak var heightFootTextField: UITextField!
    @IBOutlet weak var heightInchTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func heightSegmentControlAction(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            heightFootTextField.placeholder = "ft"
            heightInchTextField.placeholder = "in"
            heightInchTextField.isHidden = false
        } else if (sender.selectedSegmentIndex == 1) {
            heightFootTextField.placeholder = "cm"
            heightInchTextField.isHidden = true
        }
    }
    
    @IBAction func weightSegmentControlAction(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            weightTextField.placeholder = "lbs"
        } else if (sender.selectedSegmentIndex == 1) {
            weightTextField.placeholder = "kgs"
        }
    }
    
    @IBAction func calculateBMIButtonAction(_ sender: UIButton) {
        guard let weightString = weightTextField.text,
            let weight = Double(weightString) else {
            showAlert(title: "Invalid Weight", message: "Please try again")
            return
        }
        var weightInLbs = weight
        if (weightSegemntControl.selectedSegmentIndex == 1) {
            weightInLbs = weight*2.2046
        }
        
        var heightInInch = 0.0
        if (heightSegemntControl.selectedSegmentIndex == 0) {
            guard let heightFtString = heightFootTextField.text,
                let heightFt = Double(heightFtString) else {
                    showAlert(title: "Invalid Weight", message: "Please try again")
                return
            }
            guard let heightInchString = heightFootTextField.text,
                let heightInch = Double(heightInchString) else {
                    showAlert(title: "Invalid Weight", message: "Please try again")
                return
            }
            heightInInch = (heightFt*12) + heightInch
        } else {
            guard let heightString = heightFootTextField.text,
                let height = Double(heightString) else {
                    showAlert(title: "Invalid Height", message: "Please try again")
                return
            }
            heightInInch = height / 2.54
        }
        
        let bmi = calculateBMI(weight: weightInLbs, height: heightInInch)
        let bmiString = String(format: "%.2f", bmi)
        print(bmiString)
        bmiLabel.text = "BMI: \(bmiString)"
        bmiDescriptionLabel.text = "BMI Score: \(getBMIDescription(bmi: bmi))"
    }
    
    func calculateBMI(weight: Double, height: Double ) -> Double {
        return (weight/(height*height)*703)
    }
    
    func getBMIDescription(bmi: Double) -> String {
        if(bmi < 18.5){
            return "Underweight"
        }
        if bmi >= 18.5 && bmi <= 24.9 {
            return "Healthy"
        }
        if bmi >= 25 && bmi <= 29.9 {
            return "Overweight"
        }
        if bmi >= 30 {
            return "Obese"
        }
        return ""
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

