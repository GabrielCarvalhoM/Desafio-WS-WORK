//
//  ListCarsViewModel.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 27/12/22.
//

import Foundation
import UIKit



//MARK: PROTOCOL
protocol ListCarsViewModelProtocol:AnyObject {
    
    func fetchCars()
    func getTitle() -> String
    func heightForCells() -> CGFloat
    func numberOfRows() -> Int
    func getData(for indexPath:IndexPath) -> CustomCellViewModel
    func didSelect(for indexPath: IndexPath)
    
    var delegate: ListCardViewModelDelegate? { get set }
    
}

//MARK: DELEGATE
protocol ListCardViewModelDelegate: AnyObject {
    
    func didFetchSuccess()
    func didFetchError()
    func pushController(_ Controller: UIViewController)
    
}


//MARK: VIEWMODEL
class ListCarsViewModel: ListCarsViewModelProtocol {
    
    weak var delegate: ListCardViewModelDelegate?

    
    //MARK: instancias
    var api = Api()
    private var listCars = [CarModel]()
    
    //MARK: funções
    func didSelect(for indexPath: IndexPath) {
        let viewModel = DetailViewModel(Car: listCars[indexPath.row])
        let controller = DetailViewController(viewModel: viewModel)
        delegate?.pushController(controller)
    }
    
    func getData(for indexPath:IndexPath) -> CustomCellViewModel{
        CustomCellViewModel(branch: listCars[indexPath.row].branch, name: listCars[indexPath.row].fuelType)
    }
    
    func numberOfRows() -> Int {
        listCars.count
    }
    
    func heightForCells() -> CGFloat {
        return 150
    }
    
    
    func getTitle() -> String {
        return "Carros"
    }
    
    func fetchCars() {
        api.execute(model: [CarModel].self,
                    method: .get,
                    body: nil,
                    headers: nil,
                    url: .getUrl) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listCars = response
                DispatchQueue.main.async {
                    self.delegate?.didFetchSuccess()
                }
            case .failure( _):
                self.delegate?.didFetchError()
            }
        }
    }
}




