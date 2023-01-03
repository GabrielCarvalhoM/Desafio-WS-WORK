//
//  ConfirmBuyView.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 02/01/23.
//

import UIKit

class ConfirmBuyView: UIView {
    
    
    lazy var nameLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Nome:"
        return lb
    }()
    // lb para telefone.
    lazy var phoneLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Telefone:"
        return lb
    }()
    // lb para CPF.
    lazy var documentLabel: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "CPF:"
        return lb
    }()
    //linha inferior do name textfield
    lazy var lineViewName: UIView = {
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    //linha inferior do phone textfield
    lazy var lineViewPhone: UIView = {
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    //linha inferior do document textfield
    lazy var lineViewDocument: UIView = {
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    //MARK: - UITEXTFIELDS.
    
    // tf nome.
    lazy var nameTextField: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Insira seu nome"
        return tf
    }()
    // tf para telefone.
    lazy var phoneTextField: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Insira seu telefone"
        return tf
    }()
    // tf para CPF.
    lazy var documentTextField: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Insira seu CPF"
        return tf
    }()
    
    //MARK: - BOTÃO
    // botão de confirmar registro da lead;
    lazy var confirmButton: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Confirmar", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "backGroundListColor")?.withAlphaComponent(1.0)

        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confirmBtnIsTapped(target: Any,pressBtn:Selector){
        confirmButton.addTarget(target, action: pressBtn, for: .touchUpInside)
    }
    
    //MARK: - SETUPS
    private func setupViews() {
        
        // NOME
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        
        //TELEFONE
        self.addSubview(phoneLabel)
        self.addSubview(phoneTextField)
        
        //CPF
        self.addSubview(documentLabel)
        self.addSubview(documentTextField)
        
        //BOTAO DE CONFIRMAÇÂO
        self.addSubview(confirmButton)
        
        //liveViews
        self.addSubview(lineViewName)
        self.addSubview(lineViewPhone)
        self.addSubview(lineViewDocument)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //NOME
            self.nameLabel.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            self.nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            //TELEFONE
            self.phoneLabel.leadingAnchor.constraint(equalTo: self.phoneTextField.leadingAnchor),
            self.phoneLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            
            self.phoneTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.phoneTextField.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 6),
            self.phoneTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.phoneTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            //CPF
            self.documentLabel.leadingAnchor.constraint(equalTo: self.documentTextField.leadingAnchor),
            self.documentLabel.topAnchor.constraint(equalTo: self.phoneTextField.bottomAnchor, constant: 20),
            
            self.documentTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.documentTextField.topAnchor.constraint(equalTo: self.documentLabel.bottomAnchor, constant: 6),
            self.documentTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.documentTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            //BOTÂO DE CONFIRMAÇÂO
            self.confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.confirmButton.topAnchor.constraint(equalTo: self.documentTextField.bottomAnchor, constant: 50),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 40),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            //LINHAS SOB OS TEXTFIELDS
            self.lineViewName.heightAnchor.constraint(equalToConstant: 1.0),
            self.lineViewName.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor),
            self.lineViewName.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.lineViewName.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            
            self.lineViewPhone.heightAnchor.constraint(equalToConstant: 1.0),
            self.lineViewPhone.topAnchor.constraint(equalTo: self.phoneTextField.bottomAnchor),
            self.lineViewPhone.leadingAnchor.constraint(equalTo: self.phoneTextField.leadingAnchor),
            self.lineViewPhone.trailingAnchor.constraint(equalTo: self.phoneTextField.trailingAnchor),
            
            self.lineViewDocument.heightAnchor.constraint(equalToConstant: 1.0),
            self.lineViewDocument.topAnchor.constraint(equalTo: self.documentTextField.bottomAnchor),
            self.lineViewDocument.leadingAnchor.constraint(equalTo: self.documentTextField.leadingAnchor),
            self.lineViewDocument.trailingAnchor.constraint(equalTo: self.documentTextField.trailingAnchor),
            
            
        ])
    }
    
}
