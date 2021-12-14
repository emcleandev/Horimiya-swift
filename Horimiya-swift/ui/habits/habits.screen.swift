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
    @FetchRequest(
        entity: HabitEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \HabitEntity.title, ascending: true),
        ]
    ) var habitEntities: FetchedResults<HabitEntity>
    
    var body: some View {
        NavigationView() {
            ScrollView(showsIndicators: true) {
                VStack(spacing: 24) {
                    ForEach(habitEntities) { habitEntity in
                        let habit = Habit(fromEntity: habitEntity)
                        
                        HabitCard(habit: habit ?? Habit(title:"oops"))
                    }
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
