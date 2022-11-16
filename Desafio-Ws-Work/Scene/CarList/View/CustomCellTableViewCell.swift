//
//  CustomCellTableViewCell.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var car: CarModel?
    
    lazy var labelteste: UILabel = {
        
        let lb = UILabel()
        lb.text = "teste"
        lb.translatesAutoresizingMaskIntoConstraints = false
        
       return lb
    }()

   static let identifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(labelteste)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            self.labelteste.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelteste.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
        ])
        
    }
    
    private func setFipeValue(_ value:Double?) {
        
        
        
    }
    
}
