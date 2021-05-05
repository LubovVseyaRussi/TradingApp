//
//  SymbolEntity.swift
//  TradingApp
//
//  Created by Lubov on 24.04.2021.
//

import Foundation

typealias SymbolEntities = [SymbolEntity]

struct SymbolEntity: Codable {
    let name: String
    let description: String
    let price: String
    let percChange: String
    let absChange: String
    let marketStatus: String
    let logo: String
    
    private enum CodingKeys : String, CodingKey {
        case name = "Name", description = "Description", price = "Price", percChange = "Perc change", absChange = "Abs change", marketStatus = "Market status", logo = "Logo"
    }
}
