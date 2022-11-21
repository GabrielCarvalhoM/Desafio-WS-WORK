//
//  DBManager.swift
//  Desafio-Ws-Work
//
//  Created by Gabriel Carvalho on 17/11/22.
//

import UIKit
import CoreData

class DBManager {
    
    static let share = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "dataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    //MARK: - Save Leads
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Fetch Leads
    
    func fetchLead() -> [Lead] {
        
        var lead = [Lead]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Lead.description())
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "isNeedUpload == %@", "1")
        do {
            lead = try context.fetch(fetchRequest) as! [Lead]
        } catch {
            print("erro")
        }
        
        return lead
        
    }
    
    //MARK: - Update Leads
    
    func updateLead() {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Lead.description())
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "isNeedUpload == %@", "1")
        do {
            let test = try context.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue(0, forKey: "isNeedUpload")
                do {
                    try context.save()
                }
                catch {
                    print(error)
                    }
                } catch {
                    print(error)
                }
        }
}
