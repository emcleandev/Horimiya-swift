//
//  habbits.screen.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 16/11/2021.
//

import Foundation

import SwiftUI
import CoreData

struct HabbitsView: View {
    
    var body: some View {
        NavigationView() {
            Text("habbits")
                .navigationBarTitle("Habits" , displayMode: .inline )
                .navigationBarItems(trailing:
                                        NavigationLink(destination: CreateHabbitView()) {
                                            Image(systemName: "plus")
                                        }
                                        .navigationTitle("add habbit")
                                        .padding(.vertical, 8).padding(.trailing, 10))
            
            
            
        }
        .navigationBarHidden(true)
        
    }
}

struct HabbitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabbitsView()
    }
}
