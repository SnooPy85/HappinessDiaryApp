//
//  CalendarGridView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 07.02.21.
//

import SwiftUI

struct CalendarGridView: View {
    
    @EnvironmentObject var appSettings:AppSettings
    
    let frame_size:CGFloat = 25
    let currentYear:Int = CalendarHelper.getCurrentYear()
    let currentMonth:String = CalendarHelper.getCurrentMonth()
        
    // to add: if selected month is current month (and year):
    // set current day, else 0
    
    // Will be chnaged later in case selected month and year is not of current date.
    var currentDay:Int = CalendarHelper.getCurrentDayInMonth()
    
    var body: some View {
        
        let monthArray = CalendarHelper.getMonthCalenderArray(month: appSettings.selectedMonth, year: appSettings.selectedYear)
        
        VStack(alignment: .leading){
            ForEach(monthArray, id: \.self){ week in
                HStack(alignment: .lastTextBaseline){
                    ForEach(week, id: \.self){ day in
                        Spacer()
                        if day == 99 {
                            Text("").frame(width: self.frame_size, height: self.frame_size)
                        } else {
                            if (day == self.currentDay) && (appSettings.selectedYear == self.currentYear) && (appSettings.selectedMonth == self.currentMonth) {
                                
                                if (day < 10){
                                    
                                    NavigationLink(destination: DayView(date: "\(appSettings.selectedYear)-\(CalendarHelper.getNumberOfMonthMM(month: appSettings.selectedMonth))-0\(day) ").environmentObject(appSettings)){
                                        Text("\(day)")
                                    }.navigationBarTitle("Calendar").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 0/255, green: 0/255, blue: 0/255)).font(.system(size: 16, weight: .bold))
                                    
                                } else {
                            
                                    NavigationLink(destination: DayView(date: "\(appSettings.selectedYear)-\(CalendarHelper.getNumberOfMonthMM(month: appSettings.selectedMonth))-\(day) ").environmentObject(appSettings)){
                                        Text("\(day)")
                                    }.navigationBarTitle("Calendar").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 0/255, green: 0/255, blue: 0/255)).font(.system(size: 16, weight: .bold))
                                    
                                }
                                
                            } else {
                                
                                if (day < 10){
                                    
                                    NavigationLink(destination: DayView(date: "\(appSettings.selectedYear)-\(CalendarHelper.getNumberOfMonthMM(month: appSettings.selectedMonth))-0\(day) ").environmentObject(appSettings)){
                                        Text("\(day)")
                                    }.navigationBarTitle("Calendar").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255)).font(.system(size: 16))
                                    
                                } else {
                                    
                                    NavigationLink(destination: DayView(date: "\(appSettings.selectedYear)-\(CalendarHelper.getNumberOfMonthMM(month: appSettings.selectedMonth))-\(day) ").environmentObject(appSettings)){
                                        Text("\(day)")
                                    }.navigationBarTitle("Calendar").frame(width: self.frame_size, height: self.frame_size).foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255)).font(.system(size: 16))
                                    
                                }
                                
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
