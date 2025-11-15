//
//  ContentView.swift
//  GuesstheFlag
//
//  Created by Ihor Sukhachov on 01.11.2025.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding()
    }
    
}

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var gameOver = false
    @State private var userScore = 0
    @State private var rounds: Int = 0
    @State private var isEnabled = false
    @State private var chosenFlag: Int? = nil
   
   
    var body: some View {
        ZStack {
            //            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold)).prominentTitle()
                  //  .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of:").foregroundStyle(.secondary).font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer]).foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        
                        Button {
                            flagTapped(number)
                            chosenFlag = number
                            
                        }
                       
                        label: {
                            FlagImage(country: countries[number])
                                .opacity(chosenFlag == nil || chosenFlag == number ? 1 : 0.05)
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius:20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }.alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(userScore).")
            }.alert("Game over, you scored \(userScore)", isPresented: $gameOver) {
                Button("Play again", action: {
                    gameOver = false
                    userScore = 0
                }).padding()
        }
        }
    }
    func flagTapped (_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
        }
        else {
            scoreTitle = "Wrong! This is a flag of \(countries[number])."
        }
        showingScore = true
        rounds += 1
        if rounds == 5 {
            showingScore = false
            gameOver = true
            rounds = 0
        }
    }
        
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        chosenFlag = nil
    }
}

#Preview {
    ContentView()
}
