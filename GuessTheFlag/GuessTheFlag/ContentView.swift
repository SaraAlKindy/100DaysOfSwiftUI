//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sara Al-Kindy on 2019-12-22.
//  Copyright © 2019 Sara Al-Kindy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = "0"
    
    func flagTapped(_ number: Int) {
        var curScore = Int(score) ?? 0
        if number == correctAnswer {
            scoreTitle = "Correct"
            curScore += 1
        } else {
            scoreTitle = "Wrong. You tapped the flag \(countries[number])"
        }
        
        showingScore = true
        score = "\(curScore)"
    }
    
     func askQuestion() {
         countries.shuffle()
         correctAnswer = Int.random(in: 0...2)
     }
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(imageName: self.countries[number])
                    }
                }
                
                Text("Current score is \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
            }
            
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("continue")) {
                        self.askQuestion()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.blue, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}
