//
//  habit_profile.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 17/12/2021.
//

import Foundation
//
//  create_habit.page1.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 17/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct HabitProfileView: View {
    
    @EnvironmentObject var habitPub : HabitPublisher
    @State var habit : Habit
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @State var subNoteAlertText : String = ""
    @State var showingSubNoteAlert : Bool = false

    var body: some View {
        mainContent
            .navigationViewStyle(.stack)
            .navigationBarItems(trailing:
                NavigationLink(destination: EditHabitView(habitForm:  habit)) {
                    Text("Edit")
            }
                    )
            .alert(subNoteAlertText, isPresented: $showingSubNoteAlert) {
                
                Button("Ok", role: .cancel) {
                    print(habit.id)
                }
            }
    }
    
    
    var mainContent : some View {
        ScrollView{
            Section{
                headerContent
            }
            Divider().padding(.horizontal, 20)
            descriptionContent
            Spacer()
            scheduleContent
        }
    }
    var headerContent : some View {
        HStack{
            Image(systemName: "circle")
            Text(habit.title).font(.title)
            
        }.padding(EdgeInsets(top: 60, leading: 10, bottom: 20, trailing: 10))
            .font(.system(size: 25, weight: .light))
        
    }
    var descriptionContent : some View {
        Text(habit.description.isEmpty ? "One of your great habits..." : habit.description)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 20)
    }
    var scheduleContent : some View {
        Section(){
            Divider().frame(width: 50)
            VStack{
                ForEach(DayOfTheWeek.allCases) {dayInWeek in
                    let subNote = habit.schedule[dayInWeek.id]?.note ?? ""
                    let ScheduleDayRow: HStack =
                    HStack{
                        Text(dayInWeek.id)
                            .font(.system( .body, design: .monospaced))
                            .padding(.leading, 2)
                        Spacer()
                        if (!subNote.isEmpty){
                            Text(subNote)
                                .foregroundColor(Color(.darkGray))
                                .padding(.leading, 10)
                                .onTapGesture {
                                    subNoteAlertText = subNote
                                    showingSubNoteAlert = true
                                }
                        }
                        
                        Divider()
                        Group {
                            Image(systemName: "tv.fill")
                                .renderingMode(.template)
                                .foregroundColor((habit.schedule[dayInWeek.id]?.morning ?? false)
                                                 ? .black  : Color(.lightGray))
                            
                            Image(systemName: "tv.fill")
                                .renderingMode(.template)
                                .foregroundColor((habit.schedule[dayInWeek.id]?.noon ?? false)
                                                 ? .black  : Color(.lightGray))
                            
                            Image(systemName: "tv.fill")
                                .renderingMode(.template)
                                .foregroundColor((habit.schedule[dayInWeek.id]?.evening ?? false)
                                                 ? .black  : Color(.lightGray))
                            
                            Image(systemName: "tv.fill")
                                .renderingMode(.template)
                                .foregroundColor((habit.schedule[dayInWeek.id]?.night ?? false)
                                                 ? .black  : Color(.lightGray))
                        }
                    }
                    ScheduleDayRow
                }
                
            }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke( Color.secondaryLabel, lineWidth: 0.15)
            )
            .padding(.vertical, 15)
            .padding(.horizontal,20)
            
            
            
        }
        
    }
}
