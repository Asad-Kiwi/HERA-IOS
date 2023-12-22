//
//  AuthScreen.swift
//  Hera
//
//  Created by KiwiTech on 22/11/23.
//

import SwiftUI

struct AuthScreen: View {
    
    @State private var isLoginScreenActive = false
    
    @State private var isSignupScreenActive = false
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .center, spacing: 16) {
                    Image("onBoard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                 
                 
                    Image("Splash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.clear)
                        .frame(width: 173.6, height: 133.0)
                    
                    Text("Like, Match & Connect!")
                        .font(.custom("OpenSans-Bold", size: 23.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .multilineTextAlignment(.center)
                        .frame(width: 264.0, height: 32.0, alignment: .center)
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $isLoginScreenActive
                    ) {
                        Button(action: {
                            // Your action when the button is tapped
                            isLoginScreenActive = true
                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 212.0, height: 80.0)
                                    .background(Color(red: 163.0 / 255.0, green: 198.0 / 255.0, blue: 196.0 / 255.0))
                                    .cornerRadius(40.0)
                                Text("LOG IN")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .multilineTextAlignment(.center)
                                    .kerning(1.8)
                                    .frame(width: 60.0, height: 19.0, alignment: .center)
                            }
                        }
                    }
                    NavigationLink(
                        destination: SignupView(),
                        isActive: $isSignupScreenActive
                    ) {
                        Button(action: {
                            isSignupScreenActive=true
                            // Your action when the button is tapped
                        }) {
                            ZStack  {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 212.0, height: 80.0)
                                    .background(Color(red: 163.0 / 255.0, green: 198.0 / 255.0, blue: 196.0 / 255.0))
                                    .cornerRadius(40.0)
                                Text("REGISTER")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .multilineTextAlignment(.center)
                                    .kerning(1.8)
                                    .frame(height: 19.0, alignment: .center).padding()
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        Text("About Us")
                            .font(.custom("OpenSans-Bold", size: 16.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .underline()
                            .frame(width: 73.0, height: 22.0, alignment: .center)
                        Spacer()
                        Text("Support")
                            .font(.custom("OpenSans-Bold", size: 16.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .multilineTextAlignment(.trailing)
                            .underline()
                            .frame(width: 64.0, height: 22.0, alignment: .center)
                        
                    }.padding(.horizontal,40).padding(.bottom,40)
                }
            }
            .ignoresSafeArea()
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                Color.white
                    .frame(height: 4)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct AuthScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen()
    }
}
