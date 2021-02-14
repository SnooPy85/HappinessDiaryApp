//
//  CalendarHelper.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 24.01.21.
//

import Foundation


class CalendarHelper {

    // Standard date format is yyyy-MM-dd
    
    let weekDayNumber:[String: Int] = ["Monday": 0, "Tuesday": 1, "Wednesday": 2,
                                       "Thursday": 3, "Friday": 4, "Saturday": 5, "Sunday": 6, "": 99]
    
    let monthNumber:[String: String] = ["01": "January", "02": "February", "03": "March",
                                        "04": "April", "05": "May", "06": "June",
                                        "07": "July", "08": "August", "09": "September",
                                        "10": "October", "11": "November", "12": "December"]
    
    let numberOfMonth:[String: Int] = ["January": 1, "February": 2, "March": 3,
                                       "April": 4, "May": 5, "June": 6,
                                       "July": 7, "August": 8, "September": 9,
                                       "October": 10, "November": 11, "December": 12]
    
    let daysByMonth:[String: Int] = ["January": 31, "February": 28, "March": 31, "April": 30,
                                     "May": 31, "June": 30, "July": 31, "August": 31,
                                     "September": 30, "October": 31, "November": 30,
                                     "December": 31]
    
    let allMonths:[String] = ["January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December"]
    
    // Getter method to just return a months array (without instance being created).
    class func getAllMonths() -> [String] {
        return CalendarHelper().allMonths
    }
            
    class func getCurrentDate() -> String {
        let todayFormated = DateFormatter()
        todayFormated.dateFormat = "yyyy-MM-dd"
        let todayString = todayFormated.string(from: Date())
        return todayString
    }
    
    let today = getCurrentDate()
    
    class func getallYears() -> [Int] {
        let currentDate = getCurrentDate()
        let currentYear = Int(currentDate.components(separatedBy: "-")[0]) ?? 0
        var yearsArray:[Int] = []
        for y in 2020...currentYear {
            yearsArray.append(y)
        }
        return yearsArray
    }
    
    class func getCurrentDayInMonth() -> Int {
        let currentDate = getCurrentDate()
        // The int initializer cannot handle normal strings and would return nil.
        // Therefore, we forece 0 in those cases.
        return Int(currentDate.components(separatedBy: "-")[2]) ?? 0
    }

    class func getFirstWeekdayInCurrentMonth() -> String {
        // Class method that returns the first week day of a month, e.g. Tuesday.
        //let dateFormatted = DateFormatter()
        //dateFormatted.dateFormat = "yyyy-MM-dd"
        let dayNumber = getCurrentDayInMonth()
        let firstDay = Calendar.current.date(byAdding: .day, value: -(dayNumber - 1), to: Date())
        //return dateFormatted.string(from: firstDay!)
        return DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: firstDay!) - 1]
        
    }
    
    
    class func getFirstWeekdayInMonth(month: String, year: Int) -> String {
        // Method to get the first weekday of a calendar month. User needs
        // to specify the month as string, e.g. February and the year as integer, e.g. 2021.
        
        // Create a Date() instance:
        var requestedDateComponents = DateComponents()
        requestedDateComponents.year = year
        requestedDateComponents.month = CalendarHelper().numberOfMonth[month]!
        requestedDateComponents.day = 1
        let calendarInstance = Calendar(identifier: .gregorian)
        let requestedDate = calendarInstance.date(from: requestedDateComponents)
        
        // Return weekday as a string:
        return DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: requestedDate!) - 1]
        
    }
    
    
    class func getMonthCalenderArray(month: String, year: Int) -> [[Int]] {
        
        let firstWeekday = getFirstWeekdayInMonth(month: month, year: year)
        let firstWeekdayNumber = CalendarHelper().weekDayNumber[firstWeekday]!
        let numberOfDays = CalendarHelper().daysByMonth[month]!
        var monthArray:[[Int]] = []
        var dayCounter = 1
        
        for w in 0...5 {
            var weekArray:[Int] = []
            for d in 0...6 {
                if w == 0 {
                    if firstWeekdayNumber > d {
                        weekArray.append(99)
                    } else {
                        weekArray.append(dayCounter)
                        dayCounter += 1
                    }
                } else {
                    if dayCounter <= numberOfDays {
                        weekArray.append(dayCounter)
                        dayCounter += 1
                    } else {
                        weekArray.append(99)
                    }
                }
                    
            }
            monthArray.append(weekArray)
        }

        return monthArray
    }
    
    
}

//let test3 = CalendarHelper.getFirstWeekdayInMonth(month: "December", year: 2020)
//print(CalendarHelper.getMonthCalenderArray(month: "February", year: 1992))
