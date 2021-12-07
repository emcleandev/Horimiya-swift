//
//  habits.constants.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 22/11/2021.
//

import Foundation


enum HabitIcon: String, CorrespondableImage , CaseIterable, Identifiable {
    
    case classic
    case vanilla
    case another

    var id: String { self.rawValue }
    
    var imageName : String {
        switch self {
        case .classic: return "circle"
        case .vanilla: return "circle"
        case .another: return "arrow"

        }
    }
}

// Todo to just Icons and use Corresponding to organsise them
private protocol CorrespondableImage {
    var imageName: String { get }
}

