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
    @State var targetValue: Int = Int.random(in: 1...100)
    @State var score:Int = 0
    @State var round:Int = 1
    
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return
                content.foregroundColor(Color.white)
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .modifier(Shadow())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())
            
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct Shadow: ViewModifier{
        func body(content: Content) -> some View {
            return content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                
                Spacer()
                
                //Target row
                HStack {
                    Text("Put the bullseye as cloase as you can to: ").modifier(LabelStyle())
                    Text("\(targetValue)").modifier(ValueStyle())
                }
                
                Spacer()
                
                //Slider row
                HStack{
                    Text("1").modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                    Text("100").modifier(LabelStyle())
                }
                
                Spacer()
                
                //Hit Me! Button row
                Button(action: onHitMeButtonClicked) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextStyle())
                }
                    
                .alert(isPresented: $alertIsVisible) {() -> Alert in getAlert()}
                .background(Image("Button"))
                
                Spacer()
                
                //Lower Buttons row
                HStack{
                    Button(action: onStartOver){
                        HStack{
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    
                    Spacer()
                    Text("Score: ").modifier(LabelStyle())
                    Text("\(score)").modifier(ValueStyle())
                    Spacer()
                    Text("Round: ").modifier(LabelStyle())
                    Text("\(round)").modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()){
                        HStack{
                            Image("InfoIcon")
                            Text("Info").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    
                }
                .padding(.bottom, 20)
            }
            .background(Image("Background"), alignment: .center)
            .accentColor(midnightBlue)
            .navigationBarTitle("Bullseye")
        }
    }
    
    func onHitMeButtonClicked(){
        print("Button Pressed!")
        self.alertIsVisible = true
    }
    
    func onStartOver(){
        self.score = 0
        self.round = 0
        self.sliderValue = 50.0
        initNewRound()
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(getAlertTitle()),
                     message: Text("The slider value is \(Int(sliderValue.rounded())).\n" +
                        "You scored \(calculateScore()) this round."
            ), dismissButton: .default(Text("Awesome!")){
                self.score = self.score +  self.calculateScore()
                self.initNewRound()
            })
    }
    
    func getAlertTitle() -> String{
        let difference = getPointDifference()
        if difference == 0{
            return "Perfect!"
        }else if difference < 5 {
            return "You almost had it!"
        }else if difference < 10 {
            return "Not bad."
        }
        return "Are you even trying?"
    }
    
    func getPointDifference()->Int{
        return abs(self.targetValue - Int(self.sliderValue.rounded()))
    }
    
    func initNewRound(){
        self.targetValue = Int.random(in: 1...100)
        self.round = self.round + 1
    }
    
    func calculateScore() -> Int{
        let maximumScore = 100
        return maximumScore - getPointDifference() + calculateBonusPoints()
    }
    
    func calculateBonusPoints() -> Int{
        let difference = getPointDifference()
        if difference == 0{
            return 100
        }else if difference == 1 {
            return 50
        }
        return 0
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
