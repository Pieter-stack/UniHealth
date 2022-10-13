//
//  SettingsScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/13.
//

import SwiftUI

struct SettingsScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("Auth") var auth: Int = 0
    var body: some View {
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
            
            VStack{
                Text("Uni Health")
                    .font(.custom("Lato-BoldItalic", size: getScreenBounds().width/7))
                HStack{
                    Image("ArrowShort")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: getScreenBounds().width/3.5)
                        .padding(.top, -30)
                        .padding(.leading, getScreenBounds().width/2)
                }//Hstack
            }//Vstack
            .padding(.top, 20)
            
            HStack{
                Text("About Uni Health")
                    .font(.custom("Lato-BoldItalic", size: getScreenBounds().width/20))
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 50)
            
            Text("Uni Health helps university student to keep track of their health throughout the terms, tracking all the necessary key points to keep a healthy mind and body through stressful terms. ")
                .font(.custom("Lato-regular", size: getScreenBounds().width/25))
                .padding(.horizontal, 30)
                .padding(.top)
            
            Spacer()
            Text("Developed by Pieter Venter")
                .font(.custom("Lato-regular", size: getScreenBounds().width/25))
            Text("Version 1.0")
                .font(.custom("Lato-regular", size: getScreenBounds().width/25))
            
            
            if auth != 2{
                
            }else{
                NavigationLink(destination: AuthenticationScreenView().navigationBarBackButtonHidden(true)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("CustomPurple"))
                            .frame(height: 50)
                            .padding()
                        Text("Logout")
                            .font(.custom("Lato-regular", size: getScreenBounds().width/25))
                            .foregroundColor(.black)
                    }//ZStack
                }//Nav
            }
            
        }//VStack
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
