//
//  ContentView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 25.12.20.
//

import SwiftUI

struct ContentView: View {
    
    var appSettings = AppSettings()
    
    let languages = ["german", "english"]
    @State var selectedLanguage = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            NavigationView {
                NavigationLink(destination: DayView()){
                    ButtonView().environmentObject(appSettings)
                }.navigationBarTitle("Home")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
