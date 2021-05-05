//
//  CustomTableViewCell.swift
//  TradingApp
//
//  Created by Lubov on 05.05.2021.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    // MARK:- UI Elements
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 0, width: self.frame.width - 20, height: 70))
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var lineView: UIView = {
        let line = UIView(frame: CGRect(x: 0, y: 70, width: self.frame.width, height: 1))
        line.layer.borderWidth = 1
        line.layer.borderColor = UIColor.systemGray5.cgColor
        return line
    }()
    
    lazy var symbolImage: UIImageView = {
        let symbolImage = UIImageView(frame: CGRect(x: 4, y: 6, width: 50, height: 50))
        symbolImage.contentMode = .scaleAspectFit
        return symbolImage
    }()
    
    lazy var namelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 65, y: 8, width: backView.frame.width - 55, height: 20))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
    
    lazy var discriptionlbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 65, y: 30, width: backView.frame.width - 55, height: 20))
        lbl.textAlignment = .left
        lbl.textColor = .gray
        return lbl
    }()
    
    lazy var pricelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 8, width: backView.frame.width - 55, height: 20))
        lbl.textAlignment = .right
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
    
    lazy var percChangelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 30, width: backView.frame.width - 55, height: 20))
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var absChangelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: -20, y: 30, width: backView.frame.width - 55, height: 20))
        lbl.textAlignment = .right
        return lbl
    }()
    
    // MARK:- Lifecycle
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        symbolImage.layer.cornerRadius = 25
        symbolImage.clipsToBounds = true
    }
    
    // MARK:- Interface
    
    func set(symbol: SymbolEntity) {

        addSubview(backView)
        backView.addSubview(lineView)
        backView.addSubview(symbolImage)
        backView.addSubview(namelbl)
        backView.addSubview(discriptionlbl)
        backView.addSubview(pricelbl)
        backView.addSubview(percChangelbl)
        backView.addSubview(absChangelbl)
        
        
        symbolImage.sd_setImage(with: URL(string: symbol.logo))
        namelbl.text = symbol.name
        discriptionlbl.text = symbol.description
        pricelbl.text = symbol.price
        percChangelbl.text = symbol.percChange
        absChangelbl.text = symbol.absChange
        
        if symbol.percChange.contains("+") {
            percChangelbl.textColor = .systemGreen
        } else {
            percChangelbl.textColor = .systemRed
        }
        
        if symbol.absChange.contains("+") {
            absChangelbl.textColor = .systemGreen
        } else {
            absChangelbl.textColor = .systemRed
        }
    }

}
