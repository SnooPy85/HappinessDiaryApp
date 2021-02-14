//
//  CalendarGridView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 07.02.21.
//

import SwiftUI

struct CalendarGridView: View {
    
    let frame_size:CGFloat = 25
    let currentYear:Int = CalendarHelper.getCurrentYear()
    let currentMonth:String = CalendarHelper.getCurrentMonth()
    
    // to add: if selected month is current month (and year):
    // set current day, else 0
    
    let currentDay:Int = CalendarHelper.getCurrentDayInMonth()
    let monthArray = CalendarHelper.getMonthCalenderArray(month: "January", year: 2021)
    
    var body: some View {
        
        VStack(alignment: .leading){
            ForEach(monthArray, id: \.self){ week in
                HStack(alignment: .lastTextBaseline){
                    ForEach(week, id: \.self){ day in
                        Spacer()
                        if day == 99 {
                            Text("").frame(width: self.frame_size, height: self.frame_size)
                        } else {
                            if day == self.currentDay {
                                Text("\(day)").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 0/255, green: 0/255, blue: 0/255)).font(.system(size: 16, weight: .bold))
                            } else {
                                Text("\(day)").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255)).font(.system(size: 16))
                            }
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
