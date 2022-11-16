//
//  File.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import Foundation


class Api {
    
    let url = "https://wswork.com.br/cars.json"
    
    func execute<T:Codable>(model:T.Type, completion: @escaping (Result<T,Error>) -> Void){
        
        guard let url = URL(string: url) else { return }
                
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(model, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    
                }
            }
            
        }
        task.resume()
    }
    
}
