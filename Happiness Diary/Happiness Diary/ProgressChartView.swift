//
//  ProgressChartView.swift
//  Happiness Diary
//
//  Created by Sascha Rexhäuser on 20.06.21.
//

import SwiftUI
import SwiftUICharts

struct ProgressChartView: View {
    var body: some View {
        
        VStack{
            Spacer()
            // Line chart of Progress:
            HStack{
                LineChartView(data: [-9, -1, 3, 4, 8, 9, 9, -8, -2, 4, 6, 6, 8, 10, -10, 5 , 5, 5, 5, 8, 9, -7, -2, -1, 3, 8, 9, 9], title: "Feeling over time")
                BarChartView(data: ChartData(values: [("Mon.", -9),
                                                      ("Tue.", -0.5),
                                                      ("Wed.", 2.9),
                                                      ("Thu.", 5),
                                                      ("Fri.", 7),
                                                      ("Sat.", 9),
                                                      ("Sun.", 9)]),
                             title: "Weekly pattern")
            }
            Spacer()
            
        }
        
    }
}

struct ProgressChartView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChartView()
    }
}
