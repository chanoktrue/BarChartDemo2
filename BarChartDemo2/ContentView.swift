//
//  ContentView.swift
//  BarChartDemo2
//
//  Created by Thongchai Subsaidee on 21/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(percents) { i in
                BarChart(data: i)
            }
        }
        .frame(height: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarChart: View {
    @State var data: DataChart
    var body: some View {
        VStack {
            
            Text("\(data.percent, specifier: "%.2f")%")
                .font(.system(size: 14))
            
            Rectangle()
                .fill(.red)
                .frame(width: (UIScreen.main.bounds.width / 7) - 12, height: getHeight())
            
            Text(data.day)
        }
    }
    
    func getHeight() -> CGFloat {
        return 200 / 100 * data.percent
    }
}


struct DataChart: Identifiable {
    var id = UUID()
    var percent: CGFloat
    var day: String
}

var percents = [
    DataChart(percent: 35, day: "Mon"),
    DataChart(percent: 55, day: "Tue"),
    DataChart(percent: 75, day: "Wed"),
    DataChart(percent: 25, day: "Thu"),
    DataChart(percent: 95, day: "Fri"),
    DataChart(percent: 15, day: "Sat"),
    DataChart(percent: 65, day: "Sun")
]
