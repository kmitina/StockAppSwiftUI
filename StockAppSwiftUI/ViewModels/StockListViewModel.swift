//
//  StockListViewModel.swift
//  StockAppSwiftUI
//
//  Created by DVKSH on 22.06.22.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    var searchTerm: String = ""
    
   @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
