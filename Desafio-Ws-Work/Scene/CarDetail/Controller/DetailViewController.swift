//
//  DetailViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 15/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var viewModel: DetailViewModelProtocol
    private var screen: DetailView?
    
    
    init(viewModel: DetailViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.screen = DetailView()
        self.screen?.setButtonAction(target: self, pressButton: #selector(tappedButton))
        self.view = self.screen
    }
    
    @objc func tappedButton(){
        viewModel.tappedButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        
        view.backgroundColor = .systemMint
        screen?.NameText.text = viewModel.getDetails().branch
        screen?.branchText.text = String(viewModel.getDetails().branchId)
        screen?.yearText.text = viewModel.getDetails().year
        screen?.fuelTypeText.text = viewModel.getDetails().fuelType
        screen?.doorsNumberText.text = String(viewModel.getDetails().doorsNumber)
        screen?.colorText.text = viewModel.getDetails().color
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





extension DetailViewController: DetailViewModelDelegate {
    func present(controller: UIViewController) {
        present(controller , animated: true)
    }
    
}


    
    
    



