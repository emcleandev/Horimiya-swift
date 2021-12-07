//
//  card.layout.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 23/11/2021.
//

import SwiftUI

struct Card<Content>: View where Content: View {
    
    private let content: () -> Content
    private let padding: EdgeInsets
    
    init(padding: EdgeInsets = EdgeInsets(top: 10, leading: 7, bottom: 10, trailing: 7), @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.padding = padding
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 9)
                .foregroundColor(.tertiarySystemBackground)
                //.background(Color(.red))
                .shadow( radius: 2, x: 0, y: 1)

            content()
                .padding(padding)

        }
    }
}



