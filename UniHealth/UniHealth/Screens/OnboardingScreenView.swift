//
//  OnboardingScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/02.
//

import SwiftUI

struct OnboardingScreenView: View {
    @State var offset: CGFloat = 0
    var body: some View {
        GeometryReader{metrics in

            
            
            OffsetPageTabView(offset: $offset){
                HStack(spacing: 0){
                    ForEach(boardingScreens){screen in
                        VStack(spacing:15){
                                Image(screen.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, -60)
                                    .zIndex(1)
                            
                            VStack(alignment: .center, spacing: 12){
                                Text(screen.title)
                                    .font(.custom("Lato-LightItalic", size: metrics.size.width/10))
                                Text(screen.description)
                                    .font(.custom("Karla-Regular", size: metrics.size.width/25))
                                    .padding([.leading, .trailing], 50)
                            }//VStack
                            Spacer()
                            
                        }
                        
                        .frame(width:getScreenBounds().width)
                        .frame(maxHeight: .infinity)
                    }
                }//HStack
            }//OffsetPageTab
            .ignoresSafeArea(.container, edges: .all)
            //Custom Pager view
        }//Geo Reader
        .overlay(
            VStack{
                //Bottom Content
                
                if(getIndex() != 2){
                    Image("ArrowLong")
                        .padding(.bottom, -20)
                }

                
                HStack(spacing: 25){
                    
                    if(getIndex() == 2){
                        
                        Button{
                            offset = min(offset + getScreenBounds().width * 2, getScreenBounds().width * 2)
                        }label:{
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

                                Spacer()
                        }
                        
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
