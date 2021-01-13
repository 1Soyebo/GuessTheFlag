//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ibukunoluwa Soyebo on 12/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack(spacing:50) {
            Text("Tap the flag of")
            Text(countries[correctAnswer])
            ForEach(0 ..< 3) { number in
                Button(action: {
                   // flag was tapped
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
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
