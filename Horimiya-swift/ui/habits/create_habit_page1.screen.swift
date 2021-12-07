//
//  create_habit.page1.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 17/11/2021.
//

import SwiftUI

struct CreateHabitPage: View {
    @State var titleBook = ""
    @State var author = ""
    @State var isExchange: Bool = true
    @State var description = "A Good habit motivated by..."
    @State var price = ""
    @State private var categoryIndex = 0
    var categorySelection = ["Action", "classic","Comic Book","Fantasy","Historical","Literary Fiction","Biographies","Essays"]
    
    
    
    var body: some View {
        Form {
            
            
            
            Section(header: Text("Basic info").padding(.top, 10)) {
                TextField("habit Title", text: $titleBook)
            }
            
            Section() {
                Picker(selection: $categoryIndex, label: Text("Appearance")) {
                    ForEach(0 ..< categorySelection.count) {
                        Text(self.categorySelection[$0])
                    }
                }
                
            }
            
            Section(header: Text("Description")) {
                TextEditor( text: $description)
            }
            Section(header: Text("Optional")) {
                Toggle(isOn: $isExchange) {
                    Text("Checkable habits")
                }
            }
            
            Section (header: Text("Schedule")){
                VStack{
                        ForEach(0 ..< 7) {_ in
                            let ScheduleDayRow: Group = Group{
                                HStack{ Group{
                                    Text("mon")
                                }
                                Spacer()
                                
                                Image(systemName: "tv.fill")
                                Divider()
                                Group{
                                    Image(systemName: "tv.fill")
                                    Image(systemName: "tv.fill")
                                    Image(systemName: "tv.fill")
                                    Image(systemName: "tv.fill")
                                }
                            }
                            }
                            ScheduleDayRow
                        }
                    
                }
            }
        }
        //    func scheduleDayRow(){
        
        
    }
}



struct create_habit_page1_screen_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitPage()
    }
}
