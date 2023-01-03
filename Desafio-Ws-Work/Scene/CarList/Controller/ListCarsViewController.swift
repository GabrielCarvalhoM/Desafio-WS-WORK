//
//  ViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import UIKit

class ListCarsViewController: UIViewController {
    
    private var screen: ListCarsView?
    private var viewModel: ListCarsViewModelProtocol
    
    init(viewModel: ListCarsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func loadView() {
        self.screen = ListCarsView()
        self.view = self.screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        navigationItem.title = viewModel.getTitle()
        self.screen?.setupTableViewProtocols(delegate: self,datasource: self)
        viewModel.fetchCars()
        
    }
}

extension ListCarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        cell?.setup(viewModel: viewModel.getData(for: indexPath))
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(for: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForCells()
        
    }
}

extension ListCarsViewController: ListCardViewModelDelegate {
    func pushController(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)

    }
    
    func didFetchSuccess() {
        self.screen?.tableView.reloadData()
        
    }
    
    func didFetchError() {
        print("erro")
        
    }
}
