//
//  CalendarGridView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 07.02.21.
//

import SwiftUI

struct CalendarGridView: View {
    
    let rows:Int = 6
    let cols:Int = 7
    let monthArray = CalendarHelper.getMonthCalenderArray(month: "January", year: 2021)
        
    var body: some View {
        
        VStack{
            ForEach(monthArray, id: \.self){ week in
                HStack{
                    ForEach(week, id: \.self){ day in
                        Spacer()
                        if day == 99 {
                            Text("")
                        } else {
                            Text("\(day)")
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CalendarGridView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGridView()
    }
}
