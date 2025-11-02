//
//  ContentView.swift
//  GuesstheFlag
//
//  Created by Ihor Sukhachov on 01.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    /*    ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Color.secondary.frame(minWidth: 200)
            Text("Hello world").foregroundStyle(.secondary)
                .padding(20)
                .background(.ultraThinMaterial)
            
        }.ignoresSafeArea()*/
        VStack{
        //    LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        //    RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: [.blue, .black, .red, .yellow, .purple, .green], center: .center)
        }.ignoresSafeArea()
        
        
    }
}

#Preview {
    ContentView()
}
