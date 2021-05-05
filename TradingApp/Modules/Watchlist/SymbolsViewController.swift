//
//  SymbolsViewController.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import UIKit

class SymbolsViewController: UIViewController {
    
    private let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
    
    var presenter: SymbolsPresenterProtocol?
    
    private var symbols: SymbolEntities = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.viewDidLoad()
    }
    
    func configureView() {
        //view
        view.backgroundColor = .white
        //navigationBar
        title = "Watchlist"
        navigationController?.navigationBar.prefersLargeTitles = true
        //tableView
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension SymbolsViewController: SymbolsViewProtocol {
    
    func displaySymbols(symbols: SymbolEntities) {
        self.symbols = symbols
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SymbolsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        if symbols.indices.contains(indexPath.row) {
            cell.set(symbol: symbols[indexPath.row])
        }
        return cell
    }
}

extension SymbolsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}



