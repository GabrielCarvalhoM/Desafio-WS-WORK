//
//  ConfirmBuyViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 16/11/22.
//

import UIKit

class ConfirmBuyViewController: UIViewController {
    
    
    private var screen: ConfirmBuyView?
    private var viewModel: confirmBuyViewModelProtocol
    
    override func loadView() {
        screen = ConfirmBuyView()
        screen?.confirmBtnIsTapped(target: self, pressBtn: #selector(confirmBtnDidTapped))
        view = screen
    }
    
    //MARK: - VIEWDIDLOAD.
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
    }
    
    init(viewModel:confirmBuyViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func confirmBtnDidTapped() {
        
        viewModel.confirmBuyBtnIsTapped()
        
    }
    
}

extension ConfirmBuyViewController: confirmBuyViewModelDelegate{
    func confirmBtnIsTappedSuccess() {
        showAlert(title: "Sucesso ao salvar")
    }
    
    func confirmBtnIsTappedError() {
        showAlert(title: "Erro ao salvar")
    }
    
}
