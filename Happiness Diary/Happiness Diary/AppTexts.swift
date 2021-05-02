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
                                                     "spanish": "¿De que estas agradecido?"],
                                                "save":
                                                    ["german": "speichern",
                                                     "english": "save",
                                                     "spanish": "ahorrar"],
                                                "feelingQuestion":
                                                    ["german": "Wie fühlst Du Dich heute?",
                                                     "english": "How do you feel today?",
                                                     "spanish": "¿Cómo te sientes hoy?"]]
    
    let headers: [String: [String:String]] = ["thankfullnessQuestion":
                                                ["german": "Wofür bist Du dankbar?",
                                                 "english": "What are you thankfull for?",
                                                 "spanish": "¿De que estas agradecido?"],
                                              "feelingQuestion":
                                                  ["german": "Wie fühlst Du Dich heute?",
                                                   "english": "How do you feel today?",
                                                   "spanish": "¿Cómo te sientes hoy?"]]
    
    let days_texts: [String: [String : String]] = ["Monday":
                                                    ["german": "Montag",
                                                     "english": "Monday",
                                                     "spanish": "Lunes"],
                                                "Tuesday":
                                                    ["german": "Dienstag",
                                                     "english": "Tuesday",
                                                     "spanish": "Martes"],
                                                "Wednesday":
                                                    ["german": "Mittwoch",
                                                     "english": "Wednesday",
                                                     "spanish": "Miércoles"],
                                                "Thursday":
                                                    ["german": "Donnerstag",
                                                     "english": "Thutsday",
                                                     "spanish": "Jueves"],
                                                "Friday":
                                                    ["geman": "Freitag",
                                                     "english": "Friday",
                                                     "spanish": "Viernes"],
                                                "Saturday":
                                                    ["german": "Samstag",
                                                     "english": "Saturday",
                                                     "spanish": "Sábado"],
                                                "Sunday":
                                                    ["german": "Sonntag",
                                                     "english": "Sunday",
                                                     "spanish": "Domingo"]]
    
    let textfield_texts: [String: [String : String]] = ["today_is":
                                                            ["german": "Heute ist ",
                                                             "english": "Today is ",
                                                             "spanish": "Hoy es "],
                                                        "hello_day_text":
                                                            ["german": "Hey! Was für ein toller ",
                                                             "english": "Hi! What a wonderful ",
                                                             "spanish": "¡Hola! ¡Qué gran "]]
    
}

