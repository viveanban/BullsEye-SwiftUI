//
//  AboutView.swift
//  BullsEye-SwiftUI
//
//  Created by ANBAN, Viveka on 2020-05-14.
//  Copyright © 2020 ANBAN, Viveka. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    struct HeadingStyle : ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.vertical, 20.0)
        }
    }
    
    struct TextStyle : ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.horizontal, 60.0)
                .padding(.bottom, 20.0)
        }
    }
    
    var body: some View {
        Group{
            VStack {
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("Welcome to the awesome game of Bull's Eye where yo can win points and fame by dragging a slider.").modifier(TextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(TextStyle())
            }
            .background(Color.init(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0))
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
