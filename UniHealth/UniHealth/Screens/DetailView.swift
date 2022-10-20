//
//  DetailView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/19.
//

import SwiftUI

struct DetailView: View {
    var activity: Activity
    var repository: HKRepository
    @ObservedObject var viewmodel : DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(activity: Activity, repository: HKRepository){
        self.activity = activity
        self.repository = repository
        
        viewmodel = DetailViewModel(activity: activity, repository: repository)
    }
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    })
                    Spacer()
                }//Hstack
                .padding(.horizontal, 30)
                .padding(.bottom)
                HStack{
                    Text("\(activity.name)")
                        .foregroundColor(.black)
                        .font(.custom("Lato-BoldItalic", size: getScreenBounds().width/10))
                        .padding(.leading,20)
                    Spacer()
                }
                HStack{
                    Image("ArrowLong")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: getScreenBounds().width/1.2)
                        .padding(.top, -30)
                }//Hstack
                    
                
                ChartView(values: viewmodel.stats.map {viewmodel.value(from: $0.stat).value}, labels: viewmodel.stats.map {viewmodel.value(from: $0.stat).desc}, xAxisLabels: viewmodel.stats.map {DetailViewModel.dateFormatter.string(from: $0.date)}, color: "CustomBlue", barcolor: "CustomRed")
                Divider()
                HStack{
                    
                    
                    Text("Statistics")
                        .foregroundColor(.black)
                        .font(.custom("Lato-LightItalic", size: getScreenBounds().width/20))
                        .padding(.leading,20)
                    Spacer()
                }
                ScrollView(showsIndicators: true){
                    ForEach(viewmodel.stats){stat in
                        HStack{
                            ZStack{
                               RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(activity.color))
                                    .frame(width: 50, height: 50)
                                Image(activity.image)
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 30)
                            }
                            .padding(.trailing)
                         
                            Text(viewmodel.value(from: stat.stat).desc == "" ? String(0) : viewmodel.value(from: stat.stat).desc)
                            Spacer()
                            Text(stat.date, style: .date)
                        }
                        .padding()
                        .padding(.horizontal)
                        
                      
                      
                    }
                }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: Activity(id: "Steps", name: "Steps", image: "stepCount", color: "CustomBlue"), repository: HKRepository())
    }
}
