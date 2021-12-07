//
//  create_habit.page1.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 17/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct CreateHabitPage: View {
    @State private var showingPopover = false
    @State private var subNote : String = ""
    @State private var subNoteDay : DayOfTheWeek = DayOfTheWeek.mon;
    @State var habitPub : HabitPublisher

    var body: some View {
        Form {
            Section(header: Text("Basic info")) {
                TextField("Habit Title...", text: $habitPub.habitForm.title)
                //            }
                //            Section{
                Picker(selection: $habitPub.habitForm.icon, label: Text("Appearance")) {
                    ForEach(HabitIcon.allCases)  { icon in
                        HStack{
                            Image(systemName: icon.imageName )
                            Text(icon.id.capitalizingFirstLetter())
                        }
                        .tag(icon)
                    }
                }
            }
            
            Section(header: Text("Description")) {
                TextEditor( text: $habitPub.habitForm.description)
                    .textInputAutocapitalization(.none)
            }
            Section(header: Text("Optional")) {
                Toggle(isOn: $habitPub.habitForm.checkable) {
                    Text("Checkable habits")
                }
            }
            
            Section (header: Text("Schedule")){
                VStack{
                    ForEach(DayOfTheWeek.allCases) {dayInWeek in
                        let subNote = habitPub.habitForm.schedule[dayInWeek.id]?.note ?? ""
                        let ScheduleDayRow: HStack =
                        HStack{
                            Text(dayInWeek.id)
                                .font(.system( .body, design: .monospaced))
                                .padding(.leading, 2)
                            Spacer()
                            if (subNote.isEmpty){
                                Image(systemName: "plus.circle") ///:"note.text.badge.plus"
                                    .renderingMode(.template)
                                    .foregroundColor(Color(.darkGray))
                                    .onTapGesture {
                                        subNoteDay = dayInWeek;
                                        showingPopover.toggle()
                                    }
                            }
                            else{
                                Text(subNote)
                                    .foregroundColor(Color(.darkGray))
                                    .padding(.leading, 10)
                                    .onTapGesture {
                                        subNoteDay = dayInWeek;
                                        showingPopover.toggle()
                                    }
                            }
                            
                            Divider()
                            Group {
                                Image(systemName: "tv.fill")
                                    .renderingMode(.template)
                                    .foregroundColor((habitPub.habitForm.schedule[dayInWeek.id]?.morning ?? false)
                                                     ? .black  : Color(.lightGray))
                                    .onTapGesture() {
                                        habitPub.habitForm.schedule[dayInWeek.id]?.toogleMorning();
                                    }
                                Image(systemName: "tv.fill")
                                    .renderingMode(.template)
                                    .foregroundColor((habitPub.habitForm.schedule[dayInWeek.id]?.noon ?? false)
                                                     ? .black  : Color(.lightGray))
                                    .onTapGesture() {
                                        habitPub.habitForm.schedule[dayInWeek.id]?.toogleNoon();
                                    }
                                Image(systemName: "tv.fill")
                                    .renderingMode(.template)
                                    .foregroundColor((habitPub.habitForm.schedule[dayInWeek.id]?.evening ?? false)
                                                     ? .black  : Color(.lightGray))
                                    .onTapGesture() {
                                        habitPub.habitForm.schedule[dayInWeek.id]?.toogleEvening();
                                    }
                                Image(systemName: "tv.fill")
                                    .renderingMode(.template)
                                    .foregroundColor((habitPub.habitForm.schedule[dayInWeek.id]?.night ?? false)
                                                     ? .black  : Color(.lightGray))
                                    .onTapGesture() {
                                        habitPub.habitForm.schedule[dayInWeek.id]?.toogleNight();
                                    }
                            }
                        }
                        ScheduleDayRow
                    }
                }}}
        .popover(isPresented: $showingPopover) {
            Form{
                Section(header: Text("Subnote for \(subNoteDay.id)")) {
                    TextField("Subnote for day...", text: $subNote )
                        .textInputAutocapitalization(.none)
                        .multilineTextAlignment(.center)
                        .onSubmit({
                            habitPub.habitForm.schedule[subNoteDay.id]?.note = subNote;
                            showingPopover = false;
                        })
                        .padding()
                }
                HStack{
                    Spacer()
                    Button("Save"){
                        habitPub.habitForm.schedule[subNoteDay.id]?.note = subNote;
                        showingPopover = false;
                    }
                    .contentShape(Rectangle())
                    // TODO align in the centre
                    .padding()
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button("Undo", role: .destructive){
                        print("Doing undo")
                        subNote = ""
                        habitPub.habitForm.schedule[subNoteDay.id]?.note = subNote;
                        showingPopover = false;
                    }
                    .contentShape(Rectangle())
                    // TODO align in the centre
                    .padding()
                    Spacer()
                }
                
            }
            .onAppear {
                subNote = habitPub.habitForm.schedule[subNoteDay.id]?.note ?? ""
            }
            .onDisappear {
                subNote = ""
            }
        }
    }
}



