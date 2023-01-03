//
//  File.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import Foundation


class Api {
    
    //MARK: - ENUMS
    
    enum url: String {
        
        case getUrl = "https://wswork.com.br/cars.json"
        case postURL = "https://www.wswork.com.br/cars/leads/"
        
    }
    
    enum methods: String {
        case get = "GET"
        case post = "POST"
    }
    
    //MARK: - FUNC
    func execute<T:Codable>(model:T.Type, method: methods, body:Data?,headers:[String:String]?, url: url, completion: @escaping (Result<T,Error>) -> Void){
        
        guard let url = URL(string: url.rawValue) else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        headers?.compactMap( {$0} ).forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
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
