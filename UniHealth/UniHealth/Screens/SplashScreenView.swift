//
//  SplashScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/02.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @AppStorage("Auth") var auth: Int = 0
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some View {
        
        if isActive{
            
            if(isOnboarding == false){
                if auth == 1{
                    DashboardScreenView()
                }else{
                    AuthenticationScreenView()
                }
            }else{
                OnboardingScreenView()
            }
        }else{
            GeometryReader{metrics in
                Color.white
                    .ignoresSafeArea()
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Text("Uni Health")
                                    .foregroundColor(.black)
                                    .font(.custom("Lato-BoldItalic", size: metrics.size.width/7))
                                HStack{
                                    Image("ArrowShort")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: metrics.size.width/3.5)
                                        .padding(.top, -30)
                                        .padding(.leading, metrics.size.width/2)
                                }//Hstack
                            }//Vstack
                            .scaleEffect(size)
                            .opacity(opacity)
                            .onAppear{
                                withAnimation(.easeIn(duration:1.2)){
                                    self.size = 1
                                    self.opacity = 1
                                }
                            }
                            Spacer()
                        }//HStack
                        Spacer()
                        HStack{
                            Spacer()
                            Image("Splashpage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: metrics.size.width/1.3)
                                .opacity(opacity)
                                .onAppear{
                                    withAnimation(.easeIn(duration:1.2)){
                                        self.opacity = 1
                                    }
                                }
                        }//HStack
                    }//VStack
                    .ignoresSafeArea()
            }//GeoReader
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                   
                    
                }
            }
        }
        
        
        
    
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
