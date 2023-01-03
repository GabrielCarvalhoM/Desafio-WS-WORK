//
//  DetailViewModel.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 27/12/22.
//

import UIKit

protocol DetailViewModelProtocol: AnyObject{
    var delegate: DetailViewModelDelegate? { get set }
    
    func getDetails() -> CarModel
    func tappedButton()
    
}

protocol DetailViewModelDelegate: AnyObject{
    
    func present(controller: UIViewController)
    
}


class DetailViewModel: DetailViewModelProtocol{
    
    //MARK: propriedades
    weak var delegate: DetailViewModelDelegate?
    
    //MARK: Init
    init(Car: CarModel) {
        self.currentCar = Car
    }
    
     //MARK: funções
    func tappedButton() {
            let viewModel = confirmBuyViewModel(car: currentCar)
            let vc = ConfirmBuyViewController(viewModel: viewModel)
            if let presentationController = vc.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium()]
            }
        delegate?.present(controller: vc)
    }
    
    //MARK: Propriedades.
    private var currentCar: CarModel
    
    //alimentando viewModel com as informações de detalhe do veículo.
    func setDetails(_ cars: CarModel) {
        currentCar = cars
    }
    
    func getDetails() -> CarModel {
        return currentCar
    }
    
}







