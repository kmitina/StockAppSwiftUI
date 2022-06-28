//
//  StockListViewModel.swift
//  StockAppSwiftUI
//
//  Created by DVKSH on 22.06.22.
//

import Foundation

class StockListViewModel: ObservableObject {
    
   @Published var searchTerm: String = ""
    
   @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        Webservice().getTopNews { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.news = news.map(NewsArticleViewModel.init)
                }
            }
        }
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
