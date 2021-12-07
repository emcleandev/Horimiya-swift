//
//  constants.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 22/11/2021.
//

import Foundation

    enum DayOfTheWeek: String, CaseIterable, Identifiable {
        case mon
        case tue
        case wed
        case thu
        case fri
        case sat
        case sun
        var id: String { self.rawValue }
    }
var daysOfTheWeek  = [DayOfTheWeek.mon.rawValue, DayOfTheWeek.tue.rawValue, DayOfTheWeek.wed.rawValue, DayOfTheWeek.thu.rawValue, DayOfTheWeek.fri.rawValue, DayOfTheWeek.sat.rawValue , DayOfTheWeek.sun.rawValue]
    

