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
    let dataContainerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @State var entry:[DiaryDay]?
    @State private var firstThankfullnessEntry = ""
    @State private var secondThankfullnessEntry = ""
    @State private var thirdThankfullnessEntry = ""
    @State private var feelingEntry = Float64(0.0)
    
    let date:String
    
    init(date: String){
        self.date = date
        self.fetchThisDaysData()
    }
    
    func fetchThisDaysData() {
        
        do {
            let request = DiaryDay.fetchRequest() as NSFetchRequest<DiaryDay>
            let predicateFilter = NSPredicate(format: "date == %@", self.date)
            request.predicate = predicateFilter
            self.entry = try dataContainerContext.fetch(request)
            
            if self.entry != nil {
                firstThankfullnessEntry = self.entry![0].entryOne!
                secondThankfullnessEntry = self.entry![0].entryTwo!
                thirdThankfullnessEntry = self.entry![0].entryThree!
                feelingEntry = Float64(self.entry![0].feeling)
            } else {
                print("No data to fetch")
            }
            
        }
        
        catch {
            print("no data")
        }
        
    }
    
    
    func saveThisDaysData(){
        
        let newDiaryDay = DiaryDay(context: self.dataContainerContext)
        newDiaryDay.entryOne = self.firstThankfullnessEntry
        newDiaryDay.entryTwo = self.secondThankfullnessEntry
        newDiaryDay.entryThree = self.thirdThankfullnessEntry
        newDiaryDay.feeling = Float(self.feelingEntry)
        newDiaryDay.date = self.date
        
        do {
            try self.dataContainerContext.save()
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
