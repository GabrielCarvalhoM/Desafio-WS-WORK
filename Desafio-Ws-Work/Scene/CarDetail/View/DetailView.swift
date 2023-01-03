//
//  DetailView.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 27/12/22.
//

import UIKit

class DetailView: UIView {
    
    //nome
    lazy var nameLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Marca"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
        
    }()
    
    //marca
    lazy var branchLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Modelo"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
        
    }()
    
    //ano
    lazy var yearLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Ano"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
        
    }()
    
    //combustível
    lazy var fuelTypeLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Tipo de combustível"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
    }()
    
    //número de portas
    lazy var doorsNumberLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Número de portas"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
    }()
    
    //cor
    lazy var colorLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cor do veículo"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
    }()
    
    //nome
    lazy var NameText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
        
    }()
    
    //marca
    lazy var branchText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
    }()
    
    //ano
    lazy var yearText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
    }()
    
    //combustível
    lazy var fuelTypeText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
    }()
    
    //número de portas
    lazy var doorsNumberText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
    }()
    
    //cor
    lazy var colorText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        lb.textColor = .white
        return lb
    }()
    
    //botão "eu quero"
    lazy var saveLeadButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("EU QUERO!!", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        
        return btn
    }()
    
    func setButtonAction(target: Any?, pressButton: Selector){
        saveLeadButton.addTarget(target, action: pressButton, for: .touchUpInside)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        
        self.addSubview(nameLabel)
        self.addSubview(NameText)
        
        self.addSubview(branchLabel)
        self.addSubview(branchText)
        
        self.addSubview(yearLabel)
        self.addSubview(yearText)
        
        self.addSubview(fuelTypeLabel)
        self.addSubview(fuelTypeText)
        
        self.addSubview(doorsNumberLabel)
        self.addSubview(doorsNumberText)
        
        self.addSubview(colorLabel)
        self.addSubview(colorText)
        
        self.addSubview(saveLeadButton)
        
    }
    
    func setupLabels(viewModel: DetailViewModel) {
        
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            self.NameText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.NameText.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            
            self.branchLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.branchLabel.topAnchor.constraint(equalTo: self.NameText.bottomAnchor, constant: 20),
            
            self.branchText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.branchText.topAnchor.constraint(equalTo: self.branchLabel.bottomAnchor, constant: 5),
            
            self.yearLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.yearLabel.topAnchor.constraint(equalTo: self.branchText.bottomAnchor, constant: 20),
            
            self.yearText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.yearText.topAnchor.constraint(equalTo: self.yearLabel.bottomAnchor, constant: 5),
            
            self.fuelTypeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.fuelTypeLabel.topAnchor.constraint(equalTo: self.yearText.bottomAnchor, constant: 20),
            
            self.fuelTypeText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.fuelTypeText.topAnchor.constraint(equalTo: self.fuelTypeLabel.bottomAnchor, constant: 5),
            
            self.doorsNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.doorsNumberLabel.topAnchor.constraint(equalTo: self.fuelTypeText.bottomAnchor, constant: 20),
            
            self.doorsNumberText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.doorsNumberText.topAnchor.constraint(equalTo: self.doorsNumberLabel.bottomAnchor, constant: 5),
            
            self.colorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.colorLabel.topAnchor.constraint(equalTo: self.doorsNumberText.bottomAnchor, constant: 20),
            
            self.colorText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.colorText.topAnchor.constraint(equalTo: self.colorLabel.bottomAnchor, constant: 5),
            
            self.saveLeadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.saveLeadButton.topAnchor.constraint(equalTo: self.colorText.bottomAnchor, constant: 50),
            self.saveLeadButton.heightAnchor.constraint(equalToConstant: 40),
            self.saveLeadButton.leadingAnchor.constraint(equalTo: self.doorsNumberLabel.leadingAnchor),
            self.saveLeadButton.trailingAnchor.constraint(equalTo: self.doorsNumberLabel.trailingAnchor)
            
        ])
        
    }
}
