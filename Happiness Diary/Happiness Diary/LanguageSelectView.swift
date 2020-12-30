//
//  LanguageSelectView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI

struct LanguageSelectView: View {
    
    @EnvironmentObject var appSettings:AppSettings
    let appTexts = AppTexts()
    
    // Set initial value of picked language (the one that is already set).
    @State private var selectedLanguage = AppSettings().selectedLanguage
    
    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Text("Please set your language.")
                Picker(selection: $selectedLanguage, label: Text("")){
                    ForEach(self.appTexts.languages, id: \.self){ language in
                        HStack {
                            Text(language)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .padding(150)
                            Spacer()
                        }
                    }
                }
                .labelsHidden()
                .pickerStyle(WheelPickerStyle())
                        
                Button(action: {
                    self.appSettings.selectedLanguage = selectedLanguage
                                }) {
                                    Text("\(appTexts.buttons["apply"]![selectedLanguage]!)")
                                }
                
                Spacer()
                
            }
        
        }
    }
}

struct LanguageSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectView()
    }
}
