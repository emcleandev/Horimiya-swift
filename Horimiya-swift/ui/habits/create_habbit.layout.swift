//
//  create_habbit.layout.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 16/11/2021.
//

import SwiftUI
import CoreData


struct CreateHabbitView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        
        CreateHabitPage1()
            
            .navigationBarTitle("New Habit", displayMode: .inline)
            .navigationViewStyle(StackNavigationViewStyle())
            
            .navigationBarItems(trailing:
                                    Button( action: {
                                        tabSelection = 2
                                    }){Text(
                                        "create"
                                    )
                                    .fontWeight(.regular)
                                    }
                .padding(.vertical, 8).padding(.trailing, 10))
        
        /// .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct create_habit_layout_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabbitView()
    }
}

