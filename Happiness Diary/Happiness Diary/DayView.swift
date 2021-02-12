//
//  DayView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI

struct DayView: View {
    
    @EnvironmentObject var appSettings:AppSettings
    let appTexts = AppTexts()
    
    @State private var firstThankfullnessEntry = ""
    @State private var secondThankfullnessEntry = ""
    @State private var thirdThankfullnessEntry = ""
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("\(appTexts.buttons["thankfullnessQuestion"]![appSettings.selectedLanguage]!)")){
                    VStack {
                        // First textbox
                        HStack{
                            TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$firstThankfullnessEntry)
                            Button(action: {
                                print("test")
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                        Divider()
                        // Second textbox
                        HStack{
                            TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$secondThankfullnessEntry)
                            Button(action: {
                                print("test")
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                        Divider()
                        // Third textbox
                        HStack{
                            TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$thirdThankfullnessEntry)
                            Button(action: {
                                print("test")
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                    }
                }
            }
        }
    }
}
