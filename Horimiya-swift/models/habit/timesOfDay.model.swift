//
//  timesOfDay.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 29/11/2021.
//

import Foundation

struct TimesOfDay : Codable{
    private(set) var morning : Bool = false
    private(set) var noon : Bool = false
    private(set) var evening: Bool = false
    private(set) var  night : Bool = false
    private var _note : String = ""
    var note : String {
        get {
            return self._note
        }
        set {
            self._note = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    var isAllActive : Bool {
       Bool(morning && noon && evening && night)
    }
    
    func isActive() -> Bool {
        return (self.morning || self.noon || self.evening || self.night);
    }
    
    func isInactive() -> Bool {
        return !self.isActive();
    }
    mutating func fromJson(json : Data){
        do {
            let jsonDecoder = JSONDecoder()
            let times = try jsonDecoder.decode(TimesOfDay.self, from: json)
           // self = times
            self.morning =  times.morning
            self.noon =  times.noon
            self.evening =  times.evening
            self.night =  times.night
        } catch {}
    }
    mutating func fromDict(dict : [String:Any]){
        do {
            let data : Data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            fromJson(json: data)
        } catch {
            print("tod fromDict error")
        }
    }
    
    func toJson() -> Data {
        var json = Data.init()
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            let jsonString = String(data: jsonData, encoding: .utf8)
            json = jsonData
            print("jsontest02: timeOday ", jsonString!)
        }catch{}
        return json
    }
    
    
    func toStringData() -> String {
        var data = ""
        data += morning ? "o" : "-"
        data += noon ? "o" : "-"
        data += evening ? "o" : "-"
        data += night ? "o" : "-"
        return data;
    }

    init( morning : Bool = false, noon : Bool = false, evening : Bool = false, night : Bool = false, note : String = "") {
        
        self.morning = morning;
        self.noon = noon;
        self.evening = evening;
        self.night = night;
        self._note = note.trimmingCharacters(in: .whitespacesAndNewlines);
        validationHook();
    }
    
    mutating func toogleMorning(){
        self.morning.toggle();
        validationHook();
    }
    mutating func toogleNight(){
        self.night.toggle();
        validationHook();
    }
    mutating func toogleNoon(){
        self.noon.toggle();
        validationHook();
        
    }
    mutating func toogleEvening(){
        self.evening.toggle();
        validationHook();
    }
    mutating func validationHook( softValidation : Bool = false){
    }
    
    
}
