//
//  ButtonView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI


struct ButtonView: View {
    
    @EnvironmentObject var appSettings:AppSettings
    let appTexts = AppTexts()
    
    var body: some View {
        Text("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)")
            .frame(width: 200, height: 50)
            .background(Color(red: 212/255, green: 4/255, blue: 101/255))
            .foregroundColor(Color.white)
            .font(.system(size: 22, weight: .bold))
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
