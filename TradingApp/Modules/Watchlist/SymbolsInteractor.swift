//
//  SymbolsInteractor.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import Foundation

// Handles fetching and sending Symbols to the Presenter

class SymbolsInteractor: SymbolsInteractorProtocol {
    
    weak var presenter: SymbolsInteractorToPresenterProtocol?
    
    func fetchSymbols() {
        if let path = Bundle.main.path(forResource: "Symbols", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                if let symbols: SymbolEntities = try? JSONDecoder().decode(SymbolEntities.self, from: JSONSerialization.data(withJSONObject: jsonResult?["Symbols"] as Any)) {
                        presenter?.symbolsFetched(symbols: symbols)
                    } else {
                        presenter?.symbolsFetchFailed(error: "Could not read SymbolsEntity types from json")
                    }
            } catch {
                presenter?.symbolsFetchFailed(error: error.localizedDescription)
            }
        }
    }
}
