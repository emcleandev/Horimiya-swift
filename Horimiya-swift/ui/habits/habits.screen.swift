//
//  habbits.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 16/11/2021.
//

import Foundation

import SwiftUI
import CoreData

@available(iOS 15.0, *)
struct HabbitsView: View {
    @EnvironmentObject var habitPub : HabitPublisher

    var body: some View {
        NavigationView() {
            ScrollView(showsIndicators: true) {
                VStack(spacing: 24) {
                    HabitCard(habit: Habit())
                    Text(habitPub.habitForm.title)
                       
                }.padding(.top, 8)
                    .padding(.bottom, 24)
            }
            .padding([.top, .bottom], 10)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {Text("Habits")})
                ToolbarItem(placement: .navigationBarTrailing, content: {NavigationLink(destination: CreateHabbitView()) {
                    Image(systemName: "plus")
                }})
            })
        }
    }
    
}
@available(iOS 15.0, *)
struct HabbitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabbitsView()
    }
}
