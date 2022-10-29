//
//  DashboardScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/12.
//

import SwiftUI

struct DashboardScreenView: View {
    @AppStorage("Username") var username: String = ""
    private var repository = HKRepository()
    var device = UIDevice.current.name
    
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Welcome,")
                            .font(Font.custom("Lato-Regular", size: getScreenBounds().width/12))
                            .foregroundColor(.black)
                        Text("\(username)")
                            .font(Font.custom("Lato-Regular", size: getScreenBounds().width/12))
                            .foregroundColor(.black)
                        
                    }//VStack
                    
                    Spacer()
                    
                    VStack{
                        NavigationLink(destination: SettingsScreenView().navigationBarBackButtonHidden(true)){
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .foregroundColor(Color("CustomPurple"))
                            
                        }//Nav
                        
                    }//VStack
                    .padding(.top, -30)
                }//HStack
                .padding(.horizontal, 30)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(Activity.allActivities()){activity in
                            
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: getScreenBounds().width)
                                        .fill(Color(activity.color))
                                        .frame(width: getScreenBounds().width/1.7, height: getScreenBounds().height/1.6)
                                    VStack{
                                        ZStack{
                                            Circle()
                                                .frame(width: 90, height: 90)
                                                .foregroundColor(.white)
                                            Image(activity.image)
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .frame(width: 50)
                                        }
                                        .padding(.top, 20)
                                        Text(activity.name)
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 40)
                                            .padding(.top, 40)
                                            .frame(width: getScreenBounds().width/1.7,height: 100)
                                            .font(Font.custom("Lato-BoldItalic", size: getScreenBounds().width/19))
                                            .multilineTextAlignment(.center)
                                        
                                        Text("Monitor")
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                            .frame(width: getScreenBounds().width/1.7)
                                            .font(Font.custom("Lato-LightItalic", size: getScreenBounds().width/22))
                                        
                                        Text(activity.description)
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                            .padding(.horizontal)
                                            .multilineTextAlignment(.center)
                                            .frame(width: getScreenBounds().width/1.7, height: 150)
                                            .font(Font.custom("Lato-LightItalic", size: getScreenBounds().width/22))
                                        
                                        if(device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini"){
                                            
                                        }else{
                                            Spacer()
                                        }
                                        
                                        
                                        NavigationLink(destination: DetailView(activity: activity, repository: repository).navigationBarBackButtonHidden(true), label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .fill(.white)
                                                    .frame(width: 150, height: 50)
                                                Text("Let's See")
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Karla-Regular", size: getScreenBounds().width/22))
                                                Image("ArrowShort")
                                                    .padding(.top, 50)
                                            }
                                        })//nav for each
                                        .padding(.top, -60)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 100)
                                    
                                    
                                }
                                
                                
                            }//VStack
                            .padding(.horizontal)
                            
                        }//Hstack
                        
                    }//scrollview
                    .padding(.leading, getScreenBounds().width/5.5)
                    .padding(.trailing, getScreenBounds().width/5.5)
                }
                Spacer()
                
            }//VStack
            .onAppear{
                repository.requestAuthorization{ success in
                    print("Auth success \(success)")
                    
                }
            }
        }
    }
}

struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenView()
    }
}
