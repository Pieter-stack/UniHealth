//
//  OnboardingScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/02.
//

import SwiftUI

struct OnboardingScreenView: View {
    @State var offset: CGFloat = 0
    var device = UIDevice.current.name
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @AppStorage("Username") var username: String = ""
    @State private var action: Int? = 0
    var body: some View {
        GeometryReader{metrics in
            Color.white
                .ignoresSafeArea()
            
            OffsetPageTabView(offset: $offset){
                ZStack{
                    Color.white
                        .ignoresSafeArea()
                    
                    HStack(spacing: 0){
                        ForEach(boardingScreens){screen in
                            VStack(spacing:15){
                                Image(screen.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, -60)
                                
                                VStack(alignment: .center, spacing: 12){
                                    Text(screen.title)
                                        .foregroundColor(.black)
                                        .font(.custom("Lato-LightItalic", size: metrics.size.width/10))
                                    Text(screen.description)
                                        .foregroundColor(.black)
                                        .font(.custom("Karla-Regular", size: metrics.size.width/25))
                                        .padding([.leading, .trailing], 50)
                                }//VStack
                                .padding(.top, device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini" ? -30 : 0)
                                Spacer()
                                
                                
                            }
                            
                            .frame(width:getScreenBounds().width)
                            .frame(maxHeight: getScreenBounds().height)
                        }
                    }//HStack
                }
            }//OffsetPageTab

            //Custom Pager view
        }//Geo Reader
        .overlay(
            ZStack{
                VStack{
                    Image("OnboardingBackground")
                }
            }
                .allowsHitTesting(false)
                .zIndex(-1)
                .padding(.top, -60)
                ,alignment: .top
        )
        
        .overlay(
            VStack{
                //Bottom Content
                
                if(getIndex() != 2){
                    Image("ArrowLong")
                        .padding(.bottom, -20)
                }
                
                if(getIndex() == 2){
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("CustomBlue"))
                            .frame(height: 50)
                            .padding(.horizontal)
                        
                        ZStack(alignment: .leading){
                            if username.isEmpty{
                                Text("Username")
                                    .padding(.all, 20)
                                    .padding(.leading)
                                    .font(Font.custom("Lato-LightItalic", size: getScreenBounds().width/20))
                                    .foregroundColor(.black)
                            }
                            TextField("", text: $username)
                                .padding(.all, 20)
                                .padding(.leading)
                                .font(Font.custom("Lato-LightItalic", size: getScreenBounds().width/20))
                                .foregroundColor(.black)
                        }//ZStack


                        
                    }//ZStack
                    .padding(.bottom,  device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini" ? -10 : 20)
                }

                
                HStack(spacing: 25){
                    
                    if(getIndex() == 2){
                        
                        if username.isEmpty{
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("CustomPurple"))
                                    .frame(maxWidth: 120, maxHeight: 50)
                                Text("Done")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .padding(.vertical,20)
                                    .frame(maxWidth: 100)
                            }
                            .opacity(0.5)
                        }else{
                            NavigationLink(destination: AuthenticationScreenView().navigationBarBackButtonHidden(true)){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color("CustomPurple"))
                                        .frame(maxWidth: 120, maxHeight: 50)
                                    Text("Done")
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                        .padding(.vertical,20)
                                        .frame(maxWidth: 100)
                                }
                                .onTapGesture{
                                    isOnboarding.toggle()
                                }
                            }
                            
                        }
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        
                        
                    }else{
                        
                        Button{
                            offset = min(offset + getScreenBounds().width * 2, getScreenBounds().width * 2)
                        }label:{
                            Text("Skip")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("CustomRed"))
                                .padding(.vertical,20)
                                .frame(maxWidth: 100)
                            Spacer()
                        }
                    }
                    
                    
                    
                    
                
                    
                    
                    HStack(spacing: 8){
                        ForEach(boardingScreens.indices, id: \.self){ index in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(index == (getIndex()) ? Color("CustomRed"): Color("CustomDarkBlue"))
                                .frame(width: index == (getIndex()) ? 20:10, height: 10)
                                .animation(.easeIn, value: getIndex())
                        }
                        
                    }
                    Spacer()
                   
                  
                }//HStack
            }//VStack
            
                .padding()
                ,alignment: .bottom
        )
    }
    
    func getIndex()->Int{
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }

}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
            OnboardingScreenView()
        
    }
}

//extending view to get Screen bounds...
extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
