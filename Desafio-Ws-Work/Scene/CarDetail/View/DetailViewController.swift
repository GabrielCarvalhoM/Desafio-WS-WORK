//
//  DetailViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 15/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var currentCar: CarModel
    
    //MARK: - labels de títulos.
    
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
    
    //MARK: - labels que recebem valores  do currentCar.
            
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
    
    //MARK: - Botão
    
            //botão "eu quero"
    lazy var saveLeadButton: UIButton = {
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("EU QUERO!!", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        
        return btn
    }()
   
    
    //MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        
        setupLabels()
        setupSubViews()
        setupConstraints()

    }
    
    init(car: CarModel) {
        self.currentCar = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }	
    
    @objc func buttonDidTapped() {
        
        let vc = ConfirmBuyViewController(car: currentCar)
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
                }
        present(vc, animated: true)
        
    }
    
    //MARK: - SETUPS
    
    private func setupLabels() {
        NameText.text = currentCar.branch
        branchText.text = currentCar.model
        yearText.text = currentCar.year
        fuelTypeText.text = currentCar.fuelType
        doorsNumberText.text = "\(currentCar.doorsNumber)"
        colorText.text = currentCar.color
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
