//
//  habit.model.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 11/02/2022.
//

import Foundation
import CoreData

struct HabitViewModel {
    
    let habit: HabitEntity
    
    var id: NSManagedObjectID {
        return habit.objectID
    }
    
    var title: String {
        return habit.title ?? ""
    }
    
    var description: String {
        return habit.descript ?? ""
    }
    
    var icon: HabitIcon {
        if let iconRef = habit.iconRef {
            return HabitIcon(rawValue: iconRef) ?? .classic
        } else {
            return .classic
        }
    }
    
    var checkable: Bool {
        return habit.checkable
    }
    
    var schedule : [String :TimesOfDay] {
        do {
            if let jsonData  =  try JSONSerialization.jsonObject(with: habit.schedule as! Data, options: []) as? [String:AnyObject]{
                return scheduleFromJson(json: jsonData )
            }
        } catch{
        print("error reading schedule")
        }
        return defaultSchedule

    }
    
     func scheduleFromJson(json: [String:Any]) ->  [String:TimesOfDay]{
       
        let dict = json
        var schedule : [String:TimesOfDay] = defaultSchedule
        /// print(dict);
        dict.forEach { (key: String, value: Any) in
            if let nestedDict = value as? [String:Any] {
                //    nestedDict["morning"] = true
                schedule[key]?.fromDict(dict: nestedDict)
            }
        }
        return schedule
        
    }
    let defaultSchedule :  [String:TimesOfDay] = ["mon" : TimesOfDay(), "tue" : TimesOfDay(), "wed" : TimesOfDay(), "thu" : TimesOfDay(), "fri" : TimesOfDay(), "sat" : TimesOfDay(), "sun" : TimesOfDay() ]
    
    
}
