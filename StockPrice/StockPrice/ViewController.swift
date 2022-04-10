//
//  ViewController.swift
//  StockPrice
//
//  Created by Anupama Singh on 4/10/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var stockView: UIView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var stockPriceLabel: UILabel!
    @IBOutlet weak var stockDayHighLabel: UILabel!
    @IBOutlet weak var stockDayLowLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var companyList = [
        Company(name: "Apple Inc.", symbol: "AAPL"),
        Company(name: "Meta Platforms, Inc.", symbol: "FB"),
        Company(name: "Alphabet Inc.", symbol: "GOOG"),
        Company(name: "Microsoft Corporation", symbol: "MSFT"),
        Company(name: "Amazon.com, Inc.", symbol: "AMZN"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CompanyTableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: CompanyTableViewCell.reuseIdentifier)
        tableView.reloadData()
        stockView.layer.borderWidth = 1
        stockView.layer.borderColor = UIColor.black.cgColor
        stockView.layer.cornerRadius = 2
        fetchStock(for: companyList[0])
    }
    
    func updateStockUI(with stock: StockQuote) {
        companyNameLabel.text = stock.name
        companySymbolLabel.text = stock.symbol
        stockPriceLabel.text = "Price: \(stock.price)"
        stockDayHighLabel.text = "⬆️ \(stock.dayHigh)"
        stockDayLowLabel.text = "⬇️ \(stock.dayLow)"
    }
    
    @IBAction func addStockButtonAction(_ sender: Any) {
        var textField : UITextField?
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "Add", style: .default) { action in
            guard let symbol = textField?.text else { return }
            self.getStockPrice(stockSymbol: symbol, addToCompanyList: true)
        }
        alertController.addAction(UIAlertAction(title: "cancel", style: .cancel))
        alertController.addAction(OKButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Type Stock Symbol"
            textField = stockTextField
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getStockPrice(stockSymbol: String, addToCompanyList: Bool = false) {
        
        let url = "\(API.stockQuote)/\(stockSymbol.uppercased())?apikey=\(API.apiKey)"
        
        AF.request(url).response { response in
            if let error = response.error {
                self.showErrorAlert(errorMessage: error.localizedDescription)
                return
            }
            guard let data = response.data else { return }
            if let stock = try? JSONDecoder().decode([StockQuote].self, from: data).first {
                self.updateStockUI(with: stock)
                if addToCompanyList {
                    self.companyList.append(Company(name: stock.name, symbol: stock.symbol))
                    self.tableView.reloadData()
                }
            } else {
                self.showErrorAlert(errorMessage: "Invalid Stock Symbol, Please try again")
            }
            
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.reuseIdentifier, for: indexPath) as! CompanyTableViewCell
        cell.configureCell(with: companyList[indexPath.row])
        cell.fetchDelegate = self
        return cell
    }
}

extension ViewController: FetchStockDelegate {
    func fetchStock(for company: Company) {
        getStockPrice(stockSymbol: company.symbol)
    }
}

extension ViewController {
    func showErrorAlert(errorMessage: String) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
