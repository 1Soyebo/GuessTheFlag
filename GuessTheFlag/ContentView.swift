//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ibukunoluwa Soyebo on 12/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Form{
            Button("Show Alert") {
                        self.showingAlert = true
                    }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("K"), message: Text("K"), dismissButton: .default(Text("K")))
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
