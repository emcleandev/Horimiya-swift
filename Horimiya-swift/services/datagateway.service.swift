//
//  datagateway.service.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 13/12/2021.
//
import Foundation
import UIKit
import CoreData

/// The gateway service used to interface with Core Data.
struct DataGateway {
   
    
    let managedObjectContext: NSManagedObjectContext
    
    /// Creates an instance of the DataGateway with the managed object context from the AppDelegate.
    init() {
        self.managedObjectContext = PersistenceController.shared.container.viewContext
        self.managedObjectContext.automaticallyMergesChangesFromParent = true
    }
    
    /// Creates an instance of the DataGateway.
    ///
    /// - Parameters:
    ///   - managedObjectContext: The managed object context to be used.
    init(for managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        self.managedObjectContext.automaticallyMergesChangesFromParent = true
    }
}


// MARK: - Create Operations

extension DataGateway {
    

    func save(habit: Habit) {
        habit.getEntity(context: managedObjectContext)
        do {
            if
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Retrieve Operations

extension DataGateway {
    
    func getHabits() -> [Habit] {
        var habits = [HabitEntity]()
        let request = NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
        
        do {
            habits = try managedObjectContext.fetch(request)
        } catch let error {
            print("error here")
            print(error.localizedDescription)
        }
        
        return habits.compactMap { Habit(fromEntity: $0)}
    }
    
}

// MARK: - Update Operations

extension DataGateway {
    
 
    func edit(habit: Habit, set value: Any?, forKey key: String) {
        let request = NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
        request.predicate = NSPredicate(format: "identifier == %@", habit.id)
        
        do {
            let habitEntities = try managedObjectContext.fetch(request)
            
            if let habitEntity = habitEntities.first {
                habitEntity.setValue(value, forKey: key)
            }
            
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Delete Operations

extension DataGateway {
    
    func delete(habit: Habit) {
        let request = NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
        request.predicate = NSPredicate(format: "identifier == %@", habit.id)
        
        do {
            let habitEntities = try managedObjectContext.fetch(request)
            
            if let habit = habitEntities.first {
                managedObjectContext.delete(habit)
            }
            
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
