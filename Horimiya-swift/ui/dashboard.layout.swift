//
//  dashboard.layout.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 15/11/2021.
//

import Foundation

//
//  ContentView.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 15/11/2021.
//

import SwiftUI
import CoreData
@available(iOS 15.0, *)
struct DashboardView: View  {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var habitPub : HabitPublisher = HabitPublisher()
   
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("today")
                }

            HabbitsView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("habits")
                }

            BlueView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("settings")
                }
        }
        .accentColor(Color(.systemOrange))
        .environmentObject(habitPub)
    }
    
   
    struct TodayView: View {
        var body: some View {
            Text("today")
        }
    }
    struct BlueView: View {
        var body: some View {
            Text("")
            .fontWeight(.thin)
        }
    }
    
}

@available(iOS 15.0, *)
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

