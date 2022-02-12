//
//  habit.model.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 11/02/2022.
//

import Foundation
import CoreData

class HabitViewModel : ObservableObject {
    
    let habit: HabitEntity
    var scheduleStored :[String: TimesOfDay] {
        set{
        }
        get{
            return schedule
        }
    }
    init(habit : HabitEntity = HabitEntity(context: CoreDataManager.shared.viewContext) ){
        self.habit = habit
    }
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
        get {  do {
            if let jsonData  =  try JSONSerialization.jsonObject(with: habit.schedule as! Data, options: []) as? [String:AnyObject]{
                scheduleStored = scheduleFromJson(json: jsonData )
            }
        } catch{
        print("error reading schedule")
        }
        scheduleStored = defaultSchedule
        return scheduleStored
        }
        set {
            
        }

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
    
    func scheduleToJson() -> Data {
        var json = Data.init()
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self.scheduleStored)
            /// let jsonString = String(data: jsonData, encoding: .utf8)
            json = jsonData
           /// print("jsontest01 schedule: ", jsonString!)
        }catch{}
        return json
    }
    
    let defaultSchedule :  [String:TimesOfDay] = ["mon" : TimesOfDay(), "tue" : TimesOfDay(), "wed" : TimesOfDay(), "thu" : TimesOfDay(), "fri" : TimesOfDay(), "sat" : TimesOfDay(), "sun" : TimesOfDay() ]
    
    
}
