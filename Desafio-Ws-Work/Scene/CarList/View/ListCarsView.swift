//
//  ListCarsView.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 27/12/22.
//

import UIKit

class ListCarsView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor(named: "backGroundListColor")
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubView()
        self.setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupTableViewProtocols( delegate: UITableViewDelegate,  datasource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
        
    }
    
    private func setupSubView(){
        self.addSubview(tableView)
    }
    
   private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        ])
    }
    
}
