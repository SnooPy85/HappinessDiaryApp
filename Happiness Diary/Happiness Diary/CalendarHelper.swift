//
//  CalendarHelper.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 24.01.21.
//

import Foundation


class CalendarHelper {

    let weekDayNumber:[String: Int] = ["Monday": 0, "Tuesday": 1, "Wednesday": 2,
                          "Thursday": 3, "Friday": 4, "Saturday": 5, "Sunday": 6]
    
    let monthNumber:[String: String] = ["01": "January", "02": "February", "03": "March",
                                        "04": "April", "05": "May", "06": "June",
                                        "07": "July", "08": "August", "09": "September",
                                        "10": "October", "11": "November", "12": "December"]
    
    let daysByMonth:[String: Int] = ["January": 31, "February": 28, "March": 31, "April": 30,
                                     "May": 31, "June": 30, "July": 31, "August": 31,
                                     "September": 30, "October": 31, "November": 30,
                                     "December": 31]
    
    class func getCurrentDate() -> String {
        let todayFormated = DateFormatter()
        todayFormated .dateFormat = "yyyy-MM-dd"
        let todayString = todayFormated.string(from: Date())
        return todayString
    }
    
    let today = getCurrentDate()
    
}

//let test1 = CalendarHelper()
//print(test1.today)
