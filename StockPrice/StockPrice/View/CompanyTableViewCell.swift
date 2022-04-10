//
//  CompanyTableViewCell.swift
//  StockPrice
//
//  Created by Anupama Singh on 4/10/22.
//

import UIKit
import Alamofire


protocol FetchStockDelegate: AnyObject {
    func fetchStock(for company: Company)
}

class CompanyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CompanyTableViewCellId"

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companySymbolLabel: UILabel!
    @IBOutlet weak var getStockButton: UIButton!
    weak var fetchDelegate: FetchStockDelegate?
    
    var company: Company?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with company: Company) {
        self.company = company
        companyNameLabel.text = company.name
        companySymbolLabel.text = company.symbol
    }

    @IBAction func getStockButtonAction(_ sender: UIButton) {
        guard let company = company else { return }
        fetchDelegate?.fetchStock(for: company)
    }
}
