//
//  StockQuote.swift
//  StockPrice
//
//  Created by Anupama Singh on 4/10/22.
//

import Foundation

struct StockQuote: Codable {
    let symbol: String
    let name: String
    let price: Double
    let dayLow: Double
    let dayHigh: Double
}
