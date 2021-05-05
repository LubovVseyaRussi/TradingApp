//
//  AchievementsRouter.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import UIKit

 //Handles navigation for the Symbols flow, as well as sets the relationships between the View, Presenter, and Interactor for Symbols

class SymbolsRouter {
    
    class func createSymbolsModule() -> UIViewController {
        
        let view = SymbolsViewController()
        let presenter: SymbolsPresenterProtocol & SymbolsInteractorToPresenterProtocol = SymbolsPresenter()
        let interactor: SymbolsInteractorProtocol = SymbolsInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
}

