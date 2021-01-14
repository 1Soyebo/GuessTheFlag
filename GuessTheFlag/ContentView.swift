//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ibukunoluwa Soyebo on 12/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all).edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(Color.white)
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(Color.white)
                        // etc
                    }

                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.flagTapped(number)
                            }) {
                                Image(self.countries[number])
                                    .renderingMode(.original)
                            }
                        Spacer()
                    }
            }

        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
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
