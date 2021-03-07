//
//  FeelingSliderView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 07.03.21.
//

import SwiftUI

struct FeelingSliderView: View {
    
    @State private var feeling: Double = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            Slider(value: $feeling, in: -10...10, step: 0.1).accentColor(Color(red: 235/255, green: 198/255, blue: 16/255))
            HStack {
                Text("😢").font(.system(size: 40))
                Spacer()
                Text("😐").font(.system(size: 40))
                Spacer()
                Text("😃").font(.system(size: 40))
            }
        }.padding(50)
        
    }
}

struct FeelingSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSliderView()
    }
}
