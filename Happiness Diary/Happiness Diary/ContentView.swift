//
//  ContentView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 25.12.20.
//

import SwiftUI

struct ContentView: View {
    
    // This is the single source of truth for the settings.
    //@Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var appSettings:AppSettings
    //var appSettings = AppSettings()
    let appTexts = AppTexts()
    
    //@State var selectedLanguage = 0
    
    let date:String
    
    init(){
        self.date = CalendarHelper.getCurrentDate()
    }
    
    var body: some View {
        VStack(spacing: 20) {
        
            NavigationView {
                
                VStack(spacing: 20) {
                
                    Text("\(appTexts.textfield_texts["hello_day_text"]![appSettings.selectedLanguage]!)\(appTexts.days_texts[DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]]![appSettings.selectedLanguage]!).").font(.title)
                    
                    NavigationLink(destination: DayView(date: self.date).environmentObject(appSettings)){
                        ButtonView().environmentObject(appSettings)
                    }.navigationBarTitle("Home")
                    
                    NavigationLink(destination: LanguageSelectView().environmentObject(appSettings)){
                        Text("language")
                    }.navigationBarTitle("Home")
                    
                    NavigationLink(destination: CalendarFullView().environmentObject(appSettings)){
                        Text("Calendar")
                    }.navigationBarTitle("Home")
                    
                    NavigationLink(destination: ProgressChartView().environmentObject(appSettings)){
                        Text("Track your progress")
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
