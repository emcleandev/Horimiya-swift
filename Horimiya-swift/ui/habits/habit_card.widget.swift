//
//  habit_card.widget.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 22/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct HabitCard: View {
    @State var habit : Habit
    var body: some View {
        NavigationLink(destination: HabitProfileView(habit : habit)) {
            mainContent
            
        }.foregroundColor(Color.primary)
    }
    
    var mainContent : some View {
        Card{
            HStack{
                Image(systemName: habit.icon.imageName )
                    .padding(.leading, 15)
                    .padding(.trailing, 7)
                Divider()
                VStack{
                    Text(habit.title)
                }
                .padding(.leading, 7)
                Spacer()
                Image(systemName: "greaterthan")
                    .padding()
            }
        }
    }
    
}

struct ExDivider: View {
    let color: Color = .gray
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

@available(iOS 15.0, *)
struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HabitCard(habit: Habit())
        }
    }
}
