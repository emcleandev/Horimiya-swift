//
//  habit.bloc.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 22/11/2021.
//

import Foundation
import Combine
import CoreData

class HabitPublisher : ObservableObject {

    
    private var dataGateway : DataGateway

    @Published private(set) var habits = [Habit]()

    init(){
        self.dataGateway = DataGateway()
        
        
    }
    
    func loadHabits(moc: NSManagedObjectContext) {
        self.dataGateway =  DataGateway(for: moc)
        habits = dataGateway.getHabits()
        print("Habit Count ", habits.count)
    }
    
    func submitCreateHabit(moc: NSManagedObjectContext, newHabit: Habit) {
        if(newHabit.isValid()){
            self.dataGateway =  DataGateway()
            dataGateway.save(habit: newHabit)
        }
    }
   
    
    
    
}
