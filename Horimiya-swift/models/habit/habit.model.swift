//
//  habit.model.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 18/11/2021.
//

import Foundation
import CoreData
import SwiftUI

/// The model for an Habit .
struct Habit: Identifiable {
    
    var id: String
    var title: String  = ""
    var description : String
    var icon : HabitIcon
    var checkable : Bool
    var schedule : [String:TimesOfDay] = ["mon" : TimesOfDay(), "tue" : TimesOfDay(), "wed" : TimesOfDay(), "thu" : TimesOfDay(), "fri" : TimesOfDay(), "sat" : TimesOfDay(), "sun" : TimesOfDay() ]

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
    
    mutating func scheduleFromData(data: Data){
        do{
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: [])
            if let dict = jsonObj as? [String:Any] {
                /// print(dict);
                dict.forEach { (key: String, value: Any) in
                    if let nestedDict = value as? [String:Any] {
                    //    nestedDict["morning"] = true
                        self.schedule[key]?.fromDict(dict: nestedDict)
                    }
                }
            }
        }catch{}
    }
    mutating func scheduleFromJson(json: [String:Any]){
        
            let dict = json
          
                /// print(dict);
                dict.forEach { (key: String, value: Any) in
                    if let nestedDict = value as? [String:Any] {
                    //    nestedDict["morning"] = true
                        self.schedule[key]?.fromDict(dict: nestedDict)
                    }
                }
            
       
    }
    func scheduleToJson() -> Data {
        var json = Data.init()
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self.schedule)
            let jsonString = String(data: jsonData, encoding: .utf8)
            json = jsonData
           // print("jsontest01 schedule: ", jsonString!)
        }catch{}
        return json
    }
    init?(fromEntity entity: HabitEntity) {
        guard let identifier = entity.identifier else {
            print("error reading indentifier of ", entity.identifier?.uuidString ?? "" )
            return nil }
        guard let title = entity.title else {
            print("error reading title of ", identifier.uuidString )
            return nil }
        guard let descript = entity.descript else {
            print("error reading descript of ", identifier.uuidString )
            return nil }
        guard let schedule = entity.schedule else {
            print("error reading schedule of ", identifier.uuidString )
            return nil }

        let checkable = entity.checkable
        self.id = identifier.uuidString
        self.title = title
        self.description = descript
        self.checkable = checkable
        if let iconRef = entity.iconRef {
            self.icon = HabitIcon(rawValue: iconRef) ?? .classic
        } else {
            self.icon = .classic
        }
        do {
            if let jsonData  =  try JSONSerialization.jsonObject(with: schedule as! Data, options: []) as? [String:AnyObject]{
           scheduleFromJson(json: jsonData )
            }
        } catch{
            print("error")
        }
        
        
        
    }
    
    @discardableResult
    func getEntity(context: NSManagedObjectContext) -> HabitEntity {
        let entity = HabitEntity(context: context)
        //! a wasted line with identifiers
        entity.identifier = UUID.init(uuidString: id)
        entity.title = title
        entity.iconRef = icon.rawValue
        entity.descript = description
        entity.checkable = checkable
        entity.schedule =  NSData.init(data: self.scheduleToJson())
   
        return entity
    }
    
    mutating func copy(habit: Habit) {
        self.id = habit.id
        self.title = habit.title
        self.description = habit.description
        self.checkable = habit.checkable
        self.icon = habit.icon
        self.scheduleFromData(data: habit.scheduleToJson())
        print(self.title, "test0")
    }
    
    
}

