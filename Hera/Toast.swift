//
//  Toast.swift
//  Hera
//
//  Created by KiwiTech on 01/12/23.
//

import SwiftUI

struct Toast: View {
    @Binding var showToast: Bool
    @Binding var isError: Bool
    @Binding var toastText: String
    
    var body: some View {
        ZStack{
            if showToast {
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(isError ? Color(red: 1.0, green: 69.0 / 255.0, blue: 68.0 / 255.0) : Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                        .frame(width: 414.0, height: 134.0)
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: isError ? "xmark.circle.fill" : "checkmark.circle.fill")
                                .foregroundColor(Color.white)
                                .frame(width: 20.7, height: 15.0)
                                .padding(.leading, 30)
                            
                            Text(toastText)
                                .font(.custom("OpenSans-Bold", size: 16.0))
                                .foregroundColor(Color.white)
                                .frame(width: 308.0, height: 22.0, alignment: .leading)
                                .padding(.leading, 12)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.7)) // Change the background color here
                            .frame(width: 18.0, height: 5.0)
                            .cornerRadius(19)
                            .opacity(0.4)
                            .padding(.bottom, 10)
                    }
                    .onTapGesture {
                        withAnimation {
                            showToast = false
                        }
                    }
                    .transition(.move(edge: .top))
                    .animation(.easeInOut)
                }
                .frame(width: 414.0, height: 134.0)
                
            }
        }
        .ignoresSafeArea(.all)
    }
        
}

struct Toast_Previews: PreviewProvider {
    @State private static var showToast = true
    @State private static var isError = true
    @State private static var toastText = "This is a preview"

    static var previews: some View {
        Toast(showToast: $showToast, isError: $isError, toastText: $toastText)
    }
}
