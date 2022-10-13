//
//  AuthenticationScreenView.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/12.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationScreenView: View {
    var device = UIDevice.current.name
    @AppStorage("Auth") var auth: Int = 0
    @State var logged = false
    var body: some View {
        
        if logged {
            DashboardScreenView()
        }else{
           
            ZStack{
                Image("FaceID")
                    .resizable()
                    .padding(.top, -10)
                    .ignoresSafeArea()
            }//ZStack
            .overlay(
                ZStack{
                    Image("Blob")
                    VStack{
                        if auth == 0{
                            Text("Want to keep your data safe? Why not use face or touch id to keep it away from prying eyes.")
                                .padding(.horizontal, 50)
                                .font(Font.custom("Karla-Regular", size: getScreenBounds().width/25))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            HStack{
                                
                                
                               
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color("CustomPurple"))
                                            .frame(height: 50)
                                            .padding()
                                        Text("Skip")
                                            .padding(.horizontal, 50)
                                            .font(Font.custom("Karla-Regular", size: getScreenBounds().width/25))
                                            .foregroundColor(.black)
                                    }//ZStack
                                    .onTapGesture{
                                        auth = 1
                                    }
                               
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color("CustomPurple"))
                                            .frame(height: 50)
                                            .padding()
                                        Text("Keep Safe")
                                            .padding(.horizontal, 50)
                                            .font(Font.custom("Karla-Regular", size: getScreenBounds().width/25))
                                            .foregroundColor(.black)
                                    }//ZStack
                                    .onTapGesture{
                                        auth = 2
                                    }
                                

                            }//Hstack
                            .padding(.horizontal)
                        }else if auth == 2{
                            
                            Button(action: {
                                authenticateUser()
                            }, label:{
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color("CustomPurple"))
                                        .frame(height: 50)
                                        .padding()
                                    HStack{
                                        Image(systemName: AuthenticationScreenView.biometricType() == .face ? "faceid" : "touchid")
                                            .foregroundColor(.black)
                                            .padding(.trailing, -90)
                                        Text("Unlock")
                                            .padding(.horizontal, 50)
                                            .font(Font.custom("Karla-Regular", size: getScreenBounds().width/25))
                                            .foregroundColor(.black)
                                    }
                                }//ZStack
                                .padding(.horizontal)
                                .padding(.bottom, 100)
                                   })
                        }
                    }//VStack
                }//Zstack
                    .padding(.bottom, auth == 2 ? device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini" ? -100: -150 : -40)
                ,alignment: .bottom
            )//overlay
    }
        }
        
           
    
    static func biometricType() -> BiometricType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch(authContext.biometryType) {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touch : .none
        }
    }

    enum BiometricType {
        case none
        case touch
        case face
    }
    
    func authenticateUser(){
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock your data"){(status, err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            withAnimation(.easeOut){
                logged = true
            }
        }
    }
    
}

struct AuthenticationScreenView_Previews: PreviewProvider {
    static var previews: some View {
            AuthenticationScreenView()
    }
}



