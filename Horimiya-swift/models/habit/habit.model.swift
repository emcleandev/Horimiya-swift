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
    
    let id: String
    var title: String  = ""
    var description : String
    var icon : HabitIcon
    var checkable : Bool
    var schedule : [String:TimesOfDay] = ["mon" : TimesOfDay(), "tue" : TimesOfDay(), "wed" : TimesOfDay(), "thu" : TimesOfDay(), "fri" : TimesOfDay(), "sat" : TimesOfDay(), "sun" : TimesOfDay() ]
    private(set) var updatedAt : Date?
    private(set) var createdAt : Date?
    
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
    
    mutating func scheduleFromJson(json: Data){
        do{
            let jsonObj = try JSONSerialization.jsonObject(with: json, options: [])
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
    func scheduleToJson() -> Data {
        var json = Data.init()
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self.schedule)
            let jsonString = String(data: jsonData, encoding: .utf8)
            json = jsonData
            print("jsontest01 schedule: ", jsonString!)
        }catch{}
        return json
    }
    init?(fromEntity entity: HabitEntity) {
        guard let identifier = entity.identifier else { return nil }
        guard let title = entity.title else { return nil }
        guard let descript = entity.descript else { return nil }
        guard let schedule = entity.schedule else { return nil }
        guard let createdAt = entity.createdAt else {return nil}
        guard let updatedAt = entity.updatedAt else {return nil}
        let checkable = entity.checkable
        
        self.id = identifier.uuidString
        self.title = title
        self.description = descript
        self.checkable = checkable
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        if let iconRef = entity.iconRef {
            self.icon = HabitIcon(rawValue: iconRef) ?? .classic
        } else {
            self.icon = .classic
        }
        do {
            let jsonData =  try JSONSerialization.data(withJSONObject: schedule, options: .prettyPrinted)
            scheduleFromJson(json: jsonData as Data)
        } catch{}
        
        
        
    }
    
    @discardableResult
    func toEntity(context: NSManagedObjectContext) -> HabitEntity {
        let entity = HabitEntity(context: context)
        entity.identifier = UUID.init(uuidString: id)
        entity.title = title
        entity.iconRef = icon.rawValue
        entity.descript = description
        entity.checkable = checkable
        entity.schedule =  NSData.init(data: self.scheduleToJson())
        //meta data
        entity.createdAt = createdAt
        entity.updatedAt = updatedAt
        return entity
    }
    
    
}

