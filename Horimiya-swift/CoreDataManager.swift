//
//  CoreDataManager.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 13/12/2021.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    private init() {
        persistentContainer = NSPersistentContainer(name: "Horimiya_swift")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
}

// MARK: - Retrieve Operations

extension CoreDataManager {
    
    func getHabits() -> [HabitEntity] {
        let request: NSFetchRequest<HabitEntity> = HabitEntity.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func getHabitById(id: NSManagedObjectID) -> HabitEntity? {
           do {
               return try viewContext.existingObject(with: id) as? HabitEntity
           } catch {
               return nil
           }
       }
}


// MARK: - Delete Operations

extension CoreDataManager {
    func deleteHabit(habit: HabitEntity) {
        
        viewContext.delete(habit)
        save()
        
    }
}

