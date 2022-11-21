//
//  Timer.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 18/11/22.
//

import Foundation

class ControlRotine {
    
    let api = Api()
    var timer: Timer?
    
    func startTimer() {
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { Timer in
                self.makePosts()
            })
        }
    }
    
    func makePosts() {
        
        let leadsForPost = DBManager.share.fetchLead().description
        let leadsCount = DBManager.share.fetchLead().count
        
        if leadsCount > 0 {
            
            guard let data = try? JSONEncoder().encode(leadsForPost) else { return }
            api.execute(model: EmptyModel.self,
                        method:.post,
                        body: data,
                        headers: ["Content-Type":"application/json"],
                        url: .postURL) { result in
                switch result {
                case .success( _):
                    print("sucesso")
                    DBManager.share.updateLead()
                case .failure( _) :
                    print("erro")
                }
            }

        } else {
            return
        }
    }
}

