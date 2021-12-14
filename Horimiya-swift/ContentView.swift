//
//  ContentView.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 15/11/2021.
//

import SwiftUI
import CoreData

@available(iOS 15.0, *)

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
  //  @StateObject private var dataController = DataController()


    var body: some View {
        DashboardView()

    }
    
    
    
}
@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
