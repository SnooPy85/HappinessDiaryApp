//
//  ContentView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 25.12.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isFirstTime = true
    
    var body: some View {
        VStack(spacing: 20) {
            if isFirstTime {
                Text("Welcome! This is your Happiness Diary.")
            } else {
                Text("Welcome back")
            }
            
            // Use modified to format button:
            
            Button(action: {
                self.isFirstTime.toggle()
            }) {
                if isFirstTime {
                    Text("Get started")
                } else {
                    Text("Continue")
                }
            }.frame(width: 200, height: 50)
            .background(Color(red: 212/255, green: 4/255, blue: 101/255))
            .foregroundColor(Color.white)
            .font(.system(size: 22, weight: .bold))
            .clipShape(Capsule())
            .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
