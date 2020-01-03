//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sara Al-Kindy on 2019-12-28.
//  Copyright © 2019 Sara Al-Kindy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveChoice = Int.random(in: 0...2)
    @State private var winChoice = Bool.random()
    @State private var score = "0"
    @State private var showAlert = false
    @State private var alertMessage = ""

    let moves = ["ROCK", "PAPER", "SCISSORS"]
    
    func newChallenge() {
        moveChoice = Int.random(in: 0...2)
        winChoice = Bool.random()
    }
    
    func checkMove(choice: Int) {
        if winChoice {
            if moveChoice - 1 == choice || moveChoice - 1 == -1 {
                win(choice: choice)
            } else {
                lose()
            }
        } else {
            if moveChoice + 1 == choice || moveChoice + 1 == 3 {
                win(choice: choice)
            } else {
                lose()
            }
        }
    }
    
    func win(choice: Int) {
        var intScore = Int(score) ?? 0
        intScore = intScore + 1
        score = "\(intScore)"
        alertMessage = "Well Done! \(moves[moveChoice]) \(winChoice ? "beats" : "doesn't beat") \(moves[choice]). Your score is \(score)"
        showAlert = true
    }
    
    func lose() {
        alertMessage = "Wrong Choice. Try Again"
        showAlert = true
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Your score is \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("The move is \(moves[moveChoice]) and you should \(winChoice ? "WIN" : "LOSE")")
                Text("Pick the appropriate next move")
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.checkMove(choice: number)
                    }) {
                        Text(self.moves[number])
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.red)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(width: 105, height: 105)
                    .background(Color.black)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(""), message: Text(alertMessage), dismissButton: .default(Text("continue")) {
                        self.newChallenge()
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
