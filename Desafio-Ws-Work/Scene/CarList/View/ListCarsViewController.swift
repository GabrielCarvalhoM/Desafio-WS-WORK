//
//  ViewController.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import UIKit

class ListCarsViewController: UIViewController {

    //MARK: - INSTANCIAS
    var api = Api()
    private var listCars = [CarModel]()
    
    
    //tableView
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        api.execute(model: [CarModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listCars = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("erro \(error)")
            }
        }
        
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
    }


}

extension ListCarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listCars.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        
        cell?.labelteste.text = "\(listCars[indexPath.row].fipeValue)"
        
    
        return cell!
        
    }
    
}
