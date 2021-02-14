//
//  AppSettings.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI
import Combine

final class AppSettings: ObservableObject {
    
    // For the language settings
    @Published var selectedLanguage: String = "english"
    @Published var addEntryText = "add entry"
    
    // For the selected year and month in the calendar view
    @Published var selectedYear:Int = CalendarHelper.getCurrentYear()
    @Published var selectedMonth:String = CalendarHelper.getCurrentMonth()
    
}
