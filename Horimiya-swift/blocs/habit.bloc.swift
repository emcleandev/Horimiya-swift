//
//  habit.bloc.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 22/11/2021.
//

import Foundation
import Combine

class HabitPublisher : ObservableObject {
    
    var habitForm : Habit = Habit()
    @Published var text :String = "hello"
    
    func resetHabitForm(){
        print("clean habit form")
        self.habitForm = Habit()
    }
    
    func submitCreateHabit() -> Bool{
        if(habitForm.isValid()){
            do {
                try createHabit(newHabit: habitForm)
                return true;
            } catch {
                print("failed to sumbit createHabit()")
            }
        }
        return false
    }
    
    func createHabit(newHabit : Habit) -> Void {
        
    }
    
    
    
}
