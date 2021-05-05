//
//  SymbolsPresenter.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import Foundation

// Manages the interactor/view relationship for a list of Symbols

class SymbolsPresenter: SymbolsPresenterProtocol {
    weak var view: SymbolsViewProtocol?
    var interactor: SymbolsInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.fetchSymbols()
    }
}

// Functionality received from Interactor, passed to View

extension SymbolsPresenter: SymbolsInteractorToPresenterProtocol {
    
    func symbolsFetched(symbols: SymbolEntities) {
        view?.displaySymbols(symbols: symbols)
    }
    
    func symbolsFetchFailed(error: String) {
        view?.displayError(error)
    }
    
}
