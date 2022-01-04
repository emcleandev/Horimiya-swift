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
            BlueView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("today")
                }
            
            HabbitsView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("habits")
                }
                .background(Color("Background"))

            
            BlueView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("settings")
                }
                .background(Color(UIColor(red: 255, green: 255, blue: 255, alpha: 1)))
        }
//        .preferredColorScheme(<#T##colorScheme: ColorScheme?##ColorScheme?#>)
//        .foregroundColor(.red)
        .background(Color("Background"))
        .accentColor(Color(.systemOrange))
        .environmentObject(habitPub)
    }
    
    
    struct TodayView: View {
        var body: some View {
            ZStack {
                Image("sboy01")
                    .blur(radius: 10, opaque: false)
                    .ignoresSafeArea()
                    .colorMultiply(.red)
                Text("today")
                    .padding()
                    .background(.ultraThinMaterial)
            }
        }
    }
    struct BlueView: View {
        var body: some View {
            Text("Hello")
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

