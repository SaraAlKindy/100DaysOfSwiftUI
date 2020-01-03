//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sara Al-Kindy on 2019-12-25.
//  Copyright © 2019 Sara Al-Kindy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Text("This is a large title")
            .blueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
}

extension View {
    func blueTitle() -> some View {
        self.modifier(BlueTitle())
    }
}
