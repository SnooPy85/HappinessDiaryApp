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
            
            VStack{
                HeaderView(text: "\(appTexts.buttons["thankfullnessQuestion"]![appSettings.selectedLanguage]!)")
                
                VStack(spacing: 10){
                    HStack{
                        // First textbox
                        TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$firstThankfullnessEntry)
                        Button(action: {
                            print("test")
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
                    Divider()
                    HStack{
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
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
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
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
                    Divider()
                }.padding(.top, 40)
                Spacer()
                HeaderView(text: "\(appTexts.buttons["feelingQuestion"]![appSettings.selectedLanguage]!)")
                FeelingSliderView()
                Spacer()
                Button(action: {
                                }) {
                    Text("\(appTexts.buttons["save"]![appSettings.selectedLanguage]!)")
                                }
                Spacer()
                
            }
        
        }
    }
}
