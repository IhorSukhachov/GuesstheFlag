//
//  ContentView.swift
//  GuesstheFlag
//
//  Created by Ihor Sukhachov on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Color.secondary.frame(minWidth: 200)
            Text("Hello world")
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
