//
//  LanguageSelectView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI

struct LanguageSelectView: View {
    
    let languageOptions = ["english", "german", "spanish"]
    @State private var selectedLanguage = "german"
    
    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Text("Please set your language.")
                Picker(selection: $selectedLanguage, label: Text("")){
                    ForEach(self.languageOptions, id: \.self){ language in
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
