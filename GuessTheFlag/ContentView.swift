//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ibukunoluwa Soyebo on 12/01/2021.
//

import SwiftUI


struct FlagImage: View {
    var imageTitle: String
    var body: some View{
        Image(imageTitle)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    
    @State private var score_number = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var isCorrect = false
    @State private var animationAmount: Double = 0
    @State private var opacityNum: Double = 1
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(Color.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    // etc
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        if number == correctAnswer{
                            withAnimation(.easeIn(duration: 1.5)) {
                                self.animationAmount += 360
                                opacityNum = 0.25
                                
                        }
                        }
                        
                        }) {
                        FlagImage(imageTitle: self.countries[number])
                    }
                    .rotation3DEffect(.degrees((number == correctAnswer) ? animationAmount:0), axis: (x: 0, y: 1, z: 0))
                    .opacity((number != correctAnswer ? opacityNum:1))
                }
                
                Text("Score: \(score_number)")
                    .foregroundColor(Color.white)
                    .font(.title)
                
            }

        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score_number)"), dismissButton: .default(Text("Continue")) {
                opacityNum = 1
                self.askQuestion()
            })
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score_number += 10
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[correctAnswer])"
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
