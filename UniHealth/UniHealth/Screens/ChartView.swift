//
//  ChartView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/19.
//

import SwiftUI

struct ChartView: View {
    let values: [Int]
    let labels: [String]
    let xAxisLabels: [String]
    let color: String
    let barcolor: String
    var body: some View {
        GeometryReader{metrics in
            HStack(alignment: .bottom){
                ForEach(0..<values.count){ index in
                    let max = values.max() ?? 0
                    
                    VStack{
                        Text(String(values[index]))
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(-30))
                            .padding(.top)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(barcolor))
                            .frame(width: 20, height: CGFloat(values[index]) / CGFloat(max) * metrics.size.height * 0.4)
                        Text(xAxisLabels[index])
                            .foregroundColor(.black)
                            .padding(.bottom)
                        
                    }//VStack
                    
                }
            }//Hastack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(color))
            .cornerRadius(10)
            .padding(.bottom, 20)

            
        }//georeader
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let values = [213,333,44,55,33,22,44]
        let labels = ["213","333","44","55","33","22","44"]
        let xAxisValues = ["21300","33300","4400","5500","3300","2200","4400"]
        ChartView(values: values, labels: labels, xAxisLabels: xAxisValues, color: "CustomBlue", barcolor: "CustomRed")
    }
}
