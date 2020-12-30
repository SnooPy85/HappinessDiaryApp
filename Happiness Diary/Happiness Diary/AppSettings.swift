//
//  AppSettings.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI
import Combine

final class AppSettings: ObservableObject {
    
    @Published var selectedLanguage: String = "english"
    @Published var addEntryText = "add entry"
    
}
