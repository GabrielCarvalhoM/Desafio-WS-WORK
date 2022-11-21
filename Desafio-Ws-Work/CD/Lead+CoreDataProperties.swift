//
//  Lead+CoreDataProperties.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 17/11/22.
//
//

import Foundation
import CoreData


extension Lead {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lead> {
        return NSFetchRequest<Lead>(entityName: "Lead")
    }

    @NSManaged public var id: Int16
    @NSManaged public var cpf: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var isNeedUpload: Bool
    
}

extension Lead : Identifiable {

}
