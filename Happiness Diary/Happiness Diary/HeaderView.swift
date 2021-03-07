//
//  HeaderView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 07.03.21.
//

import SwiftUI

struct HeaderView: View {
    
    var headerText:String = ""
    
    init(text: String) {
        self.headerText = text
    }
        
    var body: some View {
        Text("\(self.headerText)")
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(red: 235/255, green: 198/255, blue: 16/255))
            .foregroundColor(Color.white)
            .font(.system(size: 22, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .shadow(radius: 1)
            .padding([.leading, .trailing], 20)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(text: "Wie fühlst Du Dich heute?")
    }
}
