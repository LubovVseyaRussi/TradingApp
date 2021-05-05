//
//  SymbolsProtocols.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import UIKit

// VIEW -> PRESENTER

protocol SymbolsPresenterProtocol: class {
    var view: SymbolsViewProtocol? { get set }
    var interactor: SymbolsInteractorProtocol? { get set }
    func viewDidLoad()
}

// PRESENTER -> VIEW

protocol SymbolsViewProtocol: class {
    var presenter: SymbolsPresenterProtocol? { get set }
    func displaySymbols(symbols: SymbolEntities)
    func displayError(_ error: String)
}

// PRESENTER -> INTERACTOR

protocol SymbolsInteractorProtocol: class {
    var presenter: SymbolsInteractorToPresenterProtocol? { get set }
    func fetchSymbols()
}

// INTERACTOR -> PRESENTER

protocol SymbolsInteractorToPresenterProtocol: class {
    func symbolsFetched(symbols: SymbolEntities)
    func symbolsFetchFailed(error: String)
}
