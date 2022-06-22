//
//  Stock.swift
//  StockAppSwiftUI
//
//  Created by DVKSH on 22.06.22.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
