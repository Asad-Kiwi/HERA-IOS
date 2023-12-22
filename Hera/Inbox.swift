//
//  Inbox.swift
//  Hera
//
//  Created by KiwiTech on 01/12/23.
//

import SwiftUI

struct Inbox: View {
    var body: some View {
        @Environment(\.presentationMode) var presentationMode
        ScrollView{
            VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("iconBack")
                            .foregroundColor(.clear)
                            .frame(width: 35.0, height: 35.0).cornerRadius(90)
                        Spacer()
                    }}
                Text("INBOX")
                    .font(.custom("OpenSans-Bold", size: 11.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .kerning(2.8)
                    .frame( alignment: .center).padding(.top,16)
                Text("All Conversations")
                    .font(.custom("OpenSans-Bold", size: 23.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .multilineTextAlignment(.center)
                    .frame(alignment: .center).padding(.top,8).padding(.bottom,19)
                Button(action: {
                    
                }) {
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.clear)
                                    .frame(width: 66.0, height: 66.0)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                    )
                                Image("profile")
                                    .foregroundColor(.clear)
                                    .frame(width: 60.0, height: 60.0)
                                    .background(Color(white: 216.0 / 255.0))
                                    .cornerRadius(100.0)
                                    .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                            }
                            VStack{
                                Text("Meryl")
                                    .font(.custom("OpenSans-Bold", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 46.0, height: 21.0, alignment: .center).padding(.trailing,100)
                                Text("Shared an Attachment")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 149.0, height: 21.0, alignment: .center)
                            }
                            Spacer()
                            VStack{
                                Text("Just now")
                                    .font(.custom("OpenSans", size: 13.0))
                                    .foregroundColor(Color(red: 173.0 / 255.0, green: 169.0 / 255.0, blue: 159.0 / 255.0))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 52.0, height: 21.0, alignment: .center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 10.0, height: 10.0)
                                    .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                                    .overlay(
                                        Circle()
                                            .inset(by: -0.5)
                                            .stroke(Color(white: 1.0), lineWidth: 1.0)
                                    ).cornerRadius(90).padding(.leading,34)
                            }
                        }
                    }.padding(.top,19)
                }
                Button(action: {
                    
                }) {
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.clear)
                                    .frame(width: 66.0, height: 66.0)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                    )
                                Image("profile")
                                    .foregroundColor(.clear)
                                    .frame(width: 60.0, height: 60.0)
                                    .background(Color(white: 216.0 / 255.0))
                                    .cornerRadius(100.0)
                                    .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                            }
                            VStack{
                                Text("Meryl")
                                    .font(.custom("OpenSans-Bold", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 46.0, height: 21.0, alignment: .center).padding(.trailing,100)
                                Text("Shared an Attachment")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 149.0, height: 21.0, alignment: .center)
                            }
                            Spacer()
                            VStack{
                                Text("Just now")
                                    .font(.custom("OpenSans", size: 13.0))
                                    .foregroundColor(Color(red: 173.0 / 255.0, green: 169.0 / 255.0, blue: 159.0 / 255.0))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 52.0, height: 21.0, alignment: .center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 10.0, height: 10.0)
                                    .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                                    .overlay(
                                        Circle()
                                            .inset(by: -0.5)
                                            .stroke(Color(white: 1.0), lineWidth: 1.0)
                                    ).cornerRadius(90).padding(.leading,34)
                            }
                        }
                    }.padding(.top,19)
                }
                Button(action: {
                    
                }) {
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.clear)
                                    .frame(width: 66.0, height: 66.0)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                    )
                                Image("profile")
                                    .foregroundColor(.clear)
                                    .frame(width: 60.0, height: 60.0)
                                    .background(Color(white: 216.0 / 255.0))
                                    .cornerRadius(100.0)
                                    .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                            }
                            VStack{
                                Text("Meryl")
                                    .font(.custom("OpenSans-Bold", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 46.0, height: 21.0, alignment: .center).padding(.trailing,100)
                                Text("Shared an Attachment")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 149.0, height: 21.0, alignment: .center)
                            }
                            Spacer()
                            VStack{
                                Text("Just now")
                                    .font(.custom("OpenSans", size: 13.0))
                                    .foregroundColor(Color(red: 173.0 / 255.0, green: 169.0 / 255.0, blue: 159.0 / 255.0))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 52.0, height: 21.0, alignment: .center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 10.0, height: 10.0)
                                    .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                                    .overlay(
                                        Circle()
                                            .inset(by: -0.5)
                                            .stroke(Color(white: 1.0), lineWidth: 1.0)
                                    ).cornerRadius(90).padding(.leading,34)
                            }
                        }
                    }.padding(.top,19)
                }
                Button(action: {
                    
                }) {
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.clear)
                                    .frame(width: 66.0, height: 66.0)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                    )
                                Image("profile")
                                    .foregroundColor(.clear)
                                    .frame(width: 60.0, height: 60.0)
                                    .background(Color(white: 216.0 / 255.0))
                                    .cornerRadius(100.0)
                                    .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                            }
                            VStack{
                                Text("Meryl")
                                    .font(.custom("OpenSans-Bold", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 46.0, height: 21.0, alignment: .center).padding(.trailing,100)
                                Text("Shared an Attachment")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 149.0, height: 21.0, alignment: .center)
                            }
                            Spacer()
                            VStack{
                                Text("Just now")
                                    .font(.custom("OpenSans", size: 13.0))
                                    .foregroundColor(Color(red: 173.0 / 255.0, green: 169.0 / 255.0, blue: 159.0 / 255.0))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 52.0, height: 21.0, alignment: .center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 10.0, height: 10.0)
                                    .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                                    .overlay(
                                        Circle()
                                            .inset(by: -0.5)
                                            .stroke(Color(white: 1.0), lineWidth: 1.0)
                                    ).cornerRadius(90).padding(.leading,34)
                            }
                        }
                    }.padding(.top,19)
                }
                Button(action: {
                    
                }) {
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(.clear)
                                    .frame(width: 66.0, height: 66.0)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                    )
                                Image("profile")
                                    .foregroundColor(.clear)
                                    .frame(width: 60.0, height: 60.0)
                                    .background(Color(white: 216.0 / 255.0))
                                    .cornerRadius(100.0)
                                    .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                            }
                            VStack{
                                Text("Meryl")
                                    .font(.custom("OpenSans-Bold", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 46.0, height: 21.0, alignment: .center).padding(.trailing,100)
                                Text("Shared an Attachment")
                                    .font(.custom("OpenSans-Bold", size: 14.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 149.0, height: 21.0, alignment: .center)
                            }
                            Spacer()
                            VStack{
                                Text("Just now")
                                    .font(.custom("OpenSans", size: 13.0))
                                    .foregroundColor(Color(red: 173.0 / 255.0, green: 169.0 / 255.0, blue: 159.0 / 255.0))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 52.0, height: 21.0, alignment: .center)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 10.0, height: 10.0)
                                    .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                                    .overlay(
                                        Circle()
                                            .inset(by: -0.5)
                                            .stroke(Color(white: 1.0), lineWidth: 1.0)
                                    ).cornerRadius(90).padding(.leading,34)
                            }
                        }
                    }.padding(.top,19)
                }
            }.padding(.horizontal,30)
        }.background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    Inbox()
}
