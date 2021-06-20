//
//  DayView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 29.12.20.
//

import SwiftUI
import CoreData

struct DayView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var appSettings:AppSettings
    
    let appTexts = AppTexts()
    //let dataContainerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataContainerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var entries:[DiaryDay]?
    let date:String
    
    @State var entry:[DiaryDay]?
    @State private var firstThankfullnessEntry:String
    @State private var secondThankfullnessEntry:String
    @State private var thirdThankfullnessEntry:String
    @State private var feelingEntry:Float64
    
    
    init(date: String){
        
        self.date = date
        print(self.date)
            
        // Fetch data form core data (use fetchRequest methof of DiaryDay class (and call as such). Filter by single date.
        let request = DiaryDay.fetchRequest() as NSFetchRequest<DiaryDay>
        let pred = NSPredicate(format: "date == %@", date)
        request.predicate = pred
        self.entries = try! dataContainerContext.fetch(request)
        
        if self.entries!.count == 0 {
            // Case where no entry for that day exists!
            _firstThankfullnessEntry = State(initialValue: "")
            _secondThankfullnessEntry = State(initialValue: "")
            _thirdThankfullnessEntry = State(initialValue: "")
            _feelingEntry = State(initialValue: 0.0)
        } else {
            // Case where there is data. If a certain attribute is not saved for thta day,
            // a text message is shown as empty and the slider in the middle position
            _firstThankfullnessEntry = State(initialValue: String(self.entries![0].entryOne!))
            _secondThankfullnessEntry = State(initialValue: String(self.entries![0].entryTwo!))
            _thirdThankfullnessEntry = State(initialValue: String(self.entries![0].entryThree!))
            _feelingEntry = State(initialValue: Float64(self.entries![0].feeling))
        }

    }
    
    
    func saveThisDaysData(){
        
        let newDiaryDay = DiaryDay(context: dataContainerContext)
        newDiaryDay.entryOne = self.firstThankfullnessEntry
        newDiaryDay.entryTwo = self.secondThankfullnessEntry
        newDiaryDay.entryThree = self.thirdThankfullnessEntry
        newDiaryDay.feeling = Float(self.feelingEntry)
        newDiaryDay.date = self.date
        newDiaryDay.weekday = "Monday"
        
        do {
            try dataContainerContext.save()
        }
        catch {
            print("saving did not work...")
        }

    }
    
    
    var body: some View {
        NavigationView {
            
            VStack{
                Text("\(self.date)").padding(.bottom, 20)
                
                HeaderView(text: "\(appTexts.buttons["thankfullnessQuestion"]![appSettings.selectedLanguage]!)")
                
                VStack(spacing: 10){
                    HStack{
                        // First textbox
                        TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$firstThankfullnessEntry)
                        Button(action: {
                            print("test")
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
                    Divider()
                    HStack{
                        // Second textbox
                        HStack{
                            TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$secondThankfullnessEntry)
                            Button(action: {
                                print("test")
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
                    Divider()
                    // Third textbox
                    HStack{
                        TextField("\(appTexts.buttons["addEntry"]![appSettings.selectedLanguage]!)", text: self.$thirdThankfullnessEntry)
                        Button(action: {
                            print("test")
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }.padding(.leading, 20)
                     .padding(.trailing, 20)
                    Divider()
                }.padding(.top, 40)
                Spacer()
                HeaderView(text: "\(appTexts.buttons["feelingQuestion"]![appSettings.selectedLanguage]!)")
                
                VStack(spacing: 20) {
                    Slider(value: self.$feelingEntry, in: -10...10, step: 0.1).accentColor(Color(red: 235/255, green: 198/255, blue: 16/255))
                    HStack {
                        Text("😢").font(.system(size: 40))
                        Spacer()
                        Text("😐").font(.system(size: 40))
                        Spacer()
                        Text("😃").font(.system(size: 40))
                    }
                }.padding(50)
                
                Spacer()
                Button(action: {
                    self.saveThisDaysData()
                                }) {
                    Text("\(appTexts.buttons["save"]![appSettings.selectedLanguage]!)")
                                }
                Spacer()
                
            }
        
        }
    }
}
