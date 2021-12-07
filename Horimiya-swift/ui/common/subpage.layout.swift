//
//  subpage.layout.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 17/11/2021.
//

import SwiftUI
import CoreData

struct SubPageView<Content : View> : View {
    
    var title: String  = "" 
    let content :  Content?
    
    init(title:String = "", @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View{
        content
            .padding(.top, 20)
    }
    
}

struct subpage_layout_Previews: PreviewProvider {
    static var previews: some View {
        SubPageView(){Text("hello world")}
    }
}

struct NotificationView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(16)
            .transition(.move(edge: .top))
            .animation(.spring())
    }
}
