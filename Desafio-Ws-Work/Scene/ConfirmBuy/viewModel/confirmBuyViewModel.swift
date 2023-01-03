//
//  confirmBuyViewModel.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 02/01/23.
//

import Foundation
import CoreData


protocol confirmBuyViewModelProtocol: AnyObject {
    
    func confirmBuyBtnIsTapped()
    
    var delegate: confirmBuyViewModelDelegate? { get set }
    
}

protocol confirmBuyViewModelDelegate: AnyObject {
    
    func confirmBtnIsTappedSuccess()
    func confirmBtnIsTappedError()
    
}

class confirmBuyViewModel: confirmBuyViewModelProtocol {

    //MARK: propriedades
    weak var delegate: confirmBuyViewModelDelegate?
    
    private var screen: ConfirmBuyView?
    private var leads = [Lead]()
    private var car: CarModel
    
    
    //MARK: inicializador
    init(car:CarModel){
        self.car = car
    }
    
    //MARK: ação
    func confirmBuyBtnIsTapped() {
        
        if let name = screen?.nameTextField.text,!name.isEmpty, let phone = screen?.phoneTextField.text,!name.isEmpty, let cpf = screen?.documentTextField.text,!cpf.isEmpty {
            let newLead = Lead(context: DBManager.share.context)
            newLead.name = name
            newLead.phone = phone
            newLead.cpf = cpf
            newLead.isNeedUpload = true
            newLead.id = Int16(car.id)
            DBManager.share.saveContext()
            
            delegate?.confirmBtnIsTappedSuccess()
            
        } else {
            
            delegate?.confirmBtnIsTappedError()
            
        }
        
    }
    
}

