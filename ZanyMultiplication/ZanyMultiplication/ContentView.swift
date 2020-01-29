//
//  ContentView.swift
//  ZanyMultiplication
//
//  Created by Sara Al-Kindy on 2020-01-07.
//  Copyright © 2020 Sara Al-Kindy. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var tablesSelected: [Int] = []
    @Published var numberOfQuestions: NumberOfQuestions = .five
}

struct ContentView: View {
    
    @State private var inSetup = true
    
    var body: some View {
        
        Group {
            if inSetup {
                SetupView(inSetup: $inSetup)
            } else {
                GameView(inSetup: $inSetup)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum NumberOfQuestions: String {
    case five   = "5"
    case ten    = "10"
    case twenty = "20"
    case all    = "All"
    
    static let allValues = [five, ten, twenty, all]
}

struct SetupView: View {
    @Binding var inSetup: Bool
    @EnvironmentObject var settings: UserSettings
    
    func startGame() {
        inSetup = false
    }
    
    func tableTapped(number: Int) {
        if let index = settings.tablesSelected.firstIndex(of: number) {
            settings.tablesSelected.remove(at: index)
        } else {
            settings.tablesSelected.append(number)
        }
        settings.tablesSelected.sort()
    }
    
    var body: some View {
        VStack {
            Text("Which multiplication tables")
            
            ForEach(0 ..< 4) { n in
                HStack {
                    ForEach(1 ..< 4) { m in
                        VStack {
                            Button(action: {
                                self.tableTapped(number: (n+n) + (m+n))
                            }) {
                                Text("\((n+n) + (m+n))")
                            }
                        }
                    }
                }
            }
            
            Text("How many questions")
            ForEach(NumberOfQuestions.allValues, id: \.self) { n in
                Button(action: {
                    print("I was tapped \(n)")
                }) {
                    Text("\(n.rawValue)")
                }
            }
            
            Spacer()
            
            Button(action: startGame) {
                Text("Start")
            }
            .frame(width: 100, height: 30, alignment: .center)
            .font(.body)
            .background(Color.orange)
            .clipShape(Capsule())
        }
    }
}

struct GameView: View {
    @Binding var inSetup: Bool
    @EnvironmentObject var settings: UserSettings
    
    func newGame() {
        inSetup = true
    }
    
    var body: some View {
        Button(action: newGame) {
            Text("New Game")
        }
        .frame(width: 100, height: 30, alignment: .center)
        .font(.body)
        .background(Color.orange)
        .clipShape(Capsule())
    }
}
