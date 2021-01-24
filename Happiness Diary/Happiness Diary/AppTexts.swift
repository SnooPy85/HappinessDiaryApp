//
//  AppTexts.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 30.12.20.
//

import SwiftUI


struct AppTexts {
    
    let languages: Array = ["english", "german", "spanish"]
    let buttons: [String: [String : String]] = ["addEntry":
                                                    ["german": "neuer Eintrag",
                                                     "english": "new entry",
                                                    "spanish": "nueva entrada"],
                                                "back":
                                                    ["german": "zurück",
                                                     "english": "back",
                                                     "spanish": "espalda"],
                                                "apply":
                                                    ["german": "anwenden",
                                                     "english": "apply",
                                                     "spanish": "aplicar"],
                                                "thankfullnessQuestion":
                                                    ["german": "Wofür bist Du Dankbar?",
                                                     "english": "What are you thankfull for?",
                                                     "spanish": "¿De que estas agradecido?"]]
    
}

