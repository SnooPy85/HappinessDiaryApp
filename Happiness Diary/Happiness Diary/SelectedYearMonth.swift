//
//  SelectedYearMonth.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 14.02.21.
//

import Foundation

final class SelectedYearMonth: ObservableObject {
    @Published var selectedYear:Int = CalendarHelper.getCurrentYear()
    @Published var selectedMonth:String = CalendarHelper.getCurrentMonth()
}
