//
//  ContentView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 25.12.20.
//

import SwiftUI

struct ContentView: View {
    
    // This is the single source of truth for the settings.
    var appSettings = AppSettings()
    
    let languages = ["german", "english"]
    @State var selectedLanguage = 0
    
    var body: some View {
        VStack(spacing: 20) {
        
            NavigationView {
                
                VStack(spacing: 20) {
                
                    NavigationLink(destination: DayView().environmentObject(appSettings)){
                        ButtonView().environmentObject(appSettings)
                    }.navigationBarTitle("Home")
                    
                    NavigationLink(destination: LanguageSelectView().environmentObject(appSettings)){
                        Text("language")
                    }.navigationBarTitle("Home")
                    
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
