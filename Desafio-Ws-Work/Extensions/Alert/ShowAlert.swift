//
//  ShowAlert.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 16/11/22.
//

import UIKit

extension UIViewController {
    
    //MARK: - Criei para ter facil acesso a apresentar alertas em qualquer viewController
    
    func showAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil )
        
        alertController.addAction(okButton)
        self.present (alertController, animated: true, completion: nil)
    }
    
}
