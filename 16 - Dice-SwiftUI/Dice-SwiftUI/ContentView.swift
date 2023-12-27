//
//  ContentView.swift
//  Dice-SwiftUI
//
//  Created by Fahad Mansuri on 04.09.23.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNum = 1
    @State var rightDiceNum = 1
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("diceeLogo")
                Spacer()
                HStack{
                    ExtractedView(n: leftDiceNum)
                    ExtractedView(n: rightDiceNum)
                }
                Spacer()
                Button("Roll") {
                    self.leftDiceNum = Int.random(in: 1...6)
                    self.rightDiceNum = Int.random(in: 1...6)
                }
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
                Spacer()
            }
        }
        
    }
}

struct ExtractedView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
