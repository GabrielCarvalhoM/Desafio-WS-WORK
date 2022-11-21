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
    
    //MARK: - tableView
    
            //tabela com lista de carros
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor(named: "backGroundListColor")
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tv
    }()
    
    //MARK: - didLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Carros"

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
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
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("erro \(error)")
            }
        }
        
        setupConstraints()
        
    }
    
    //MARK: - setups
            //setup das constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
    }

}

    //MARK: - extensions

            //extesion para manipulação dos métodos próprios da tableView.
extension ListCarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        
        cell?.branchLabel.text = listCars[indexPath.row].branch
    
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController(car: listCars[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
