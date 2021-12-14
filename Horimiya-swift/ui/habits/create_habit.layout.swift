////
////  create_habbit.layout.swift
////  Horimiya-swift
////
////  Created by Emmanuel Mclean on 16/11/2021.
////
//
//import SwiftUI
//import CoreData
//
//
//@available(iOS 15.0, *)
//struct CreateHabbitViewOld: View {
//    @EnvironmentObject var habitPub : HabitPublisher
//
//    var body: some View {
//
//        CreateHabitPage(habitForm: habitPub.habitForm)
//
//            .navigationBarTitle("New Habit", displayMode: .inline)
//            .navigationViewStyle(StackNavigationViewStyle())
//
//            .navigationBarItems(trailing:
//                                    Button( action: {
//             //   print("name: ",HabitPublisher().habitForm.title)
//
//                print(  HabitPublisher().habitForm.scheduleToJson());
//                if(habitPub.habitForm.isValid()){
//                    print("create habit")
//                    habitPub.resetHabitForm()
//                   // self.dismiss(animated: true)
//                }
//
//                }){
//                    Text("Create")
//                    .fontWeight(.regular)
//            }
//            )
//            .onAppear(perform:{
//                habitPub.resetHabitForm()
//            }
//    )
//}
//}
//
//@available(iOS 15.0, *)
//struct create_habit_layout_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateHabbitView()
//    }
//}
//
