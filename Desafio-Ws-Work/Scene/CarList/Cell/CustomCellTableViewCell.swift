//
//  CustomCellTableViewCell.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    private var bgView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    var branchLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.font = .systemFont(ofSize: 30)
        lb.textAlignment = .center
        lb.textColor = .systemMint
        
        return lb
    }()
    
    private var nameLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.font = .systemFont(ofSize: 30)
        lb.textAlignment = .center
        lb.textColor = .systemMint
        
        return lb
    }()
    
    static let identifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = UIColor(named: "backGroundListColor")?.withAlphaComponent(0.0)
        
        self.setupSubViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews(){
        self.addSubview(bgView)
        self.addSubview(branchLabel)
        self.addSubview(nameLabel)
    }
    
    func setup(viewModel:CustomCellViewModel){
        branchLabel.text = viewModel.branch
        nameLabel.text = viewModel.name
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.branchLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.branchLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameLabel.topAnchor.constraint(equalTo: self.branchLabel.bottomAnchor, constant: 10)
            
            
        ])
    }
}
