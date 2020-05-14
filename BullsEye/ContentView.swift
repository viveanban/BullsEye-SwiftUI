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
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            VStack {
                
                Spacer()
                
                //Target row
                HStack {
                    Text("Put the bullseye as cloase as you can to: ")
                    Text("100")
                }
                
                Spacer()
                
                //Slider row
                HStack{
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                
                Spacer()

                //Hit Me! Button row
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
                
                Spacer()
                
                //Lower Buttons row
                HStack{
                    Button(action: {}){
                        Text("Start Over")
                    }
                    Spacer()
                    Text("Score: ")
                    Text("999999")
                    Spacer()
                    Text("Round: ")
                    Text("999")
                    Spacer()
                    Button(action: {}){
                        Text("Info")
                    }
                    
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
