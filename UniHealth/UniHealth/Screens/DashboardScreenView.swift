//
//  DashboardScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/12.
//

import SwiftUI

struct DashboardScreenView: View {
    @AppStorage("Username") var username: String = ""
    var body: some View {
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
        }//VStack
    }
}

struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenView()
    }
}
