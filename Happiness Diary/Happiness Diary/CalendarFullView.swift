//
//  CalendarFullView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 14.02.21.
//

import SwiftUI

struct CalendarFullView: View {
    
    //@Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var appSettings:AppSettings
    let appTexts = AppTexts()
    
    // Initialize year and month pre-selected.
    @State private var selectedYear = AppSettings().selectedYear
    @State private var selectedMonth = AppSettings().selectedMonth
    
    let allYears:[Int] = CalendarHelper.getallYears()
    let allMonths:[String] = CalendarHelper.getAllMonths()
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                VStack{
                    Spacer()
                    Text("Year")
                    Picker(selection: $selectedYear, label: Text("")){
                        ForEach(self.allYears, id: \.self){ year in
                            HStack {
                                Text("\(year)")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding(150)
                                Spacer()
                            }
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    Text("Month")
                    Picker(selection: $selectedMonth, label: Text("")){
                        ForEach(self.allMonths, id: \.self){ month in
                            HStack {
                                Text("\(month)")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding(150)
                                Spacer()
                            }
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                    Spacer()
                }
                
                Spacer()
                Button(action: {
                    self.appSettings.selectedYear = selectedYear
                    self.appSettings.selectedMonth = selectedMonth
                                }) {
                                    Text("\(appTexts.buttons["apply"]![appSettings.selectedLanguage]!)")
                                }
                
                Spacer()
                Spacer()
                CalendarGridView().environmentObject(appSettings)
                Spacer()
                Spacer()
            }
            
        }
    }
    
}

struct CalendarFullView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarFullView()
    }
}
