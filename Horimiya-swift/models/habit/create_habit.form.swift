//
//  create_habit.form.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 07/12/2021.
//

import Foundation
class CreateHabitForm : ObservableObject{
 
    let id: String
    @Published var title: String  = ""
    @Published var description : String
    @Published var icon : HabitIcon
    @Published var checkable : Bool
    @Published  var schedule : [String:TimesOfDay] = ["mon" : TimesOfDay(), "tue" : TimesOfDay(), "wed" : TimesOfDay(), "thu" : TimesOfDay(), "fri" : TimesOfDay(), "sat" : TimesOfDay(), "sun" : TimesOfDay() ]
   
    /// Creates an instance of a Habit.
    /// - Parameters:
    ///   - id: The unique identifier for the instance. By default, this is set to a generated UUID.
    init(id: String = UUID().uuidString, title: String = "",description: String = "", icon: HabitIcon =  HabitIcon.classic, checkable: Bool = false, schedule:[String:TimesOfDay]? = nil) {
        self.id = id;
        self.title = title;
        self.icon  = icon;
        self.description = description;
        self.checkable = checkable;
        self.schedule = schedule ?? self.schedule;
    }
    
    func isValid() -> Bool {
        if(self.title.count < 1){
            return false;
        }
        return true;
    }
    
}
