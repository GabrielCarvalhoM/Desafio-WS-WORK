//
//  CarModel.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 14/11/22.
//

import Foundation

struct CarModel: Codable {
    
    let id: Int
    let branchId: Int
    let branch: String
    let model: String
    @ToString var year: String?
    let fuelType: String
    let doorsNumber: Int
    @ToString var fipeValue: String?
    let color: String
    @ToString var registrationTimestamp: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case branchId = "marca_id"
        case branch = "marca_nome"
        case model = "nome_modelo"
        case year = "ano"
        case fuelType = "combustivel"
        case doorsNumber = "num_portas"
        case fipeValue = "valor_fipe"
        case color = "cor"
        case registrationTimestamp = "timestamp_cadastro"
    }
    
    @propertyWrapper
    struct ToString: Codable {
        var wrappedValue: String?
        
        init(from decoder: Decoder) throws {
            let value = try decoder.singleValueContainer()
            if let valueDouble = try? value.decode(Double.self) {
                wrappedValue = String(valueDouble)
            }else if let valueInt = try? value.decode(Int.self) {
                wrappedValue = String(valueInt)
            }else if let valueString = try? value.decode(String.self) {
                wrappedValue = valueString
            }
        }
    }
}
    
    

