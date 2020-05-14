//
//  ContentView.swift
//  BullsEye
//
//  Created by ANBAN, Viveka on 2020-05-14.
//  Copyright © 2020 ANBAN, Viveka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to my first app")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up"), dismissButton: .default(Text("Awesome!")))
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
