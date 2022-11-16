//
//  DetailViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 15/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var car: CarModel
    
    lazy var nameLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Marca"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var NameText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var branchLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Modelo"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var branchText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var yearLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Ano"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var yearText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var fuelTypeLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Tipo de combustível"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var fuelTypeText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var doorsNumberLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Número de portas"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var doorsNumberText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var colorLabel: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cor do veículo"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .brown
        return lb
        
    }()
    
    lazy var colorText: UILabel = {
       
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " "
        return lb
        
    }()
    
    lazy var saveLeadButton: UIButton = {
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("EU QUERO!!", for: .normal)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        
        return btn
    }()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        NameText.text = car.branch
        branchText.text = car.model
        yearText.text = car.year
        fuelTypeText.text = car.fuelType
        doorsNumberText.text = "\(car.doorsNumber)"
        colorText.text = car.color
        
        setupSubViews()
        setupConstraints()
        
        
    }
    
    init(car: CarModel) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        
        view.addSubview(nameLabel)
        view.addSubview(NameText)
        
        view.addSubview(branchLabel)
        view.addSubview(branchText)
        
        view.addSubview(yearLabel)
        view.addSubview(yearText)
        
        view.addSubview(fuelTypeLabel)
        view.addSubview(fuelTypeText)
        
        view.addSubview(doorsNumberLabel)
        view.addSubview(doorsNumberText)
        
        view.addSubview(colorLabel)
        view.addSubview(colorText)
        
        view.addSubview(saveLeadButton)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            self.NameText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.NameText.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            
            self.branchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.branchLabel.topAnchor.constraint(equalTo: self.NameText.bottomAnchor, constant: 20),
            
            self.branchText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.branchText.topAnchor.constraint(equalTo: self.branchLabel.bottomAnchor, constant: 5),
            
            self.yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.yearLabel.topAnchor.constraint(equalTo: self.branchText.bottomAnchor, constant: 20),
            
            self.yearText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.yearText.topAnchor.constraint(equalTo: self.yearLabel.bottomAnchor, constant: 5),
            
            self.fuelTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.fuelTypeLabel.topAnchor.constraint(equalTo: self.yearText.bottomAnchor, constant: 20),
            
            self.fuelTypeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.fuelTypeText.topAnchor.constraint(equalTo: self.fuelTypeLabel.bottomAnchor, constant: 5),
            
            self.doorsNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.doorsNumberLabel.topAnchor.constraint(equalTo: self.fuelTypeText.bottomAnchor, constant: 20),
            
            self.doorsNumberText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.doorsNumberText.topAnchor.constraint(equalTo: self.doorsNumberLabel.bottomAnchor, constant: 5),
            
            self.colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.colorLabel.topAnchor.constraint(equalTo: self.doorsNumberText.bottomAnchor, constant: 20),
            
            self.colorText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.colorText.topAnchor.constraint(equalTo: self.colorLabel.bottomAnchor, constant: 5),
            
            self.saveLeadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.saveLeadButton.topAnchor.constraint(equalTo: self.colorText.bottomAnchor, constant: 50),
            self.saveLeadButton.heightAnchor.constraint(equalToConstant: 40),
            self.saveLeadButton.leadingAnchor.constraint(equalTo: self.doorsNumberLabel.leadingAnchor),
            self.saveLeadButton.trailingAnchor.constraint(equalTo: self.doorsNumberLabel.trailingAnchor)
        
        ])
        
    }
    
}
