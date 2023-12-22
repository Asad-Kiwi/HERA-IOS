//
//  SmDashboard.swift
//  Hera
//
//  Created by KiwiTech on 12/12/23.
//

import SwiftUI

import URLImage
import Alamofire
struct SmDashboardUser: Codable, Identifiable {
    let age: Int
    let email: String
    let first_name: String
    let id: Int
    let last_name: String
    let middle_name: String?
    let profile_pic: String
    let role_id: Int
    let state_id: Int
    let state_name: String
    let username: String
    let zipcode: String
    init(id: Int, age: Int, email: String, first_name: String, last_name: String, middle_name: String?, profile_pic: String, role_id: Int, state_id: Int, state_name: String,username: String, zipcode: String) {
        self.id = id
        self.age = age
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.middle_name = middle_name
        self.profile_pic = profile_pic
        self.role_id = role_id
        self.state_id = state_id
        self.state_name = state_name
        self.username = username
        self.zipcode = zipcode

    }
}
struct SmDashboard: View {
    @ObservedObject var userModel: UserModel
    @State private var isProfile = false
    @State private var isMessage = false
    
    @State private var users: [SmDashboardUser] = []
    @State private var search = ""
    var body: some View {
        VStack{
            HStack{
                NavigationLink(
                destination: Profile( userModel: userModel),
                isActive: $isProfile
            ) {
                Button(action: {
                    isProfile=true
                }) {
                        ZStack{
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 38.0, height: 38.0)
                                .overlay(
                                    Circle()
                                        .stroke(Color(red: 147.0 / 255.0, green: 192.0 / 255.0, blue: 186.0 / 255.0), lineWidth: 1)
                                )
                            URLImage(url: URL(string: userModel.user?.profile_pic ?? "Demo") ?? URL(string: "Demo")!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30.0, height: 30.0)
                                    .cornerRadius(90)
                        }
                        }
                    
                }
            }
                Spacer()
                NavigationLink(
                    destination: Inbox(),
                    isActive: $isMessage
                ) {
                    Button(action: {
                        isMessage=true
                    })  {VStack{ Image("IconChat")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24.0, height: 24.0)
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 36.0, height: 19.0)
                                .background(Color(red: 1.0, green: 69.0 / 255.0, blue: 68.0 / 255.0))
                                .cornerRadius(10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .inset(by: 0.5)
                                        .stroke(Color(white: 1.0), lineWidth: 1.0)
                                )
                            Text("New")
                                .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                .foregroundColor(Color(white: 1.0))
                                .frame(width: 25.0, height: 15.0, alignment: .center)
                        }
                    }.padding(.top,24)}}
            }.padding(.horizontal,26).background(Color(red: 246.0 / 255.0, green: 245.0 / 255.0, blue: 239.0 / 255.0))
            Text("Like, Match & Connect!")
                .font(.custom("OpenSansRoman-Bold", size: 11.0))
                .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                .textCase(.uppercase)
                .kerning(2.8)
                .frame(width: 202.0, height: 15.0, alignment: .center).padding(.top,21)
            Text("Your match might just be a click away!")
                .font(.custom("OpenSansRoman-Bold", size: 23.0))
                .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                .multilineTextAlignment(.center)
                .frame(width: 259.0, height: 64.0, alignment: .center).padding(.top,8)
            HStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 297.0, height: 50.0)
                        .background(Color(white: 1.0))
                        .opacity(0.8008953276134673)
                        .cornerRadius(8.0)
                    HStack{
                        Image("search")
                            .foregroundColor(.clear)
                            .frame(width: 20.0, height: 20.0)
                            .padding(.leading,20).padding(.vertical,15)
                        TextField("Search", text: $search)
                            .font(.custom("OpenSans", size: 16.0))
                            .foregroundColor(Color(white: 0.0)).padding(.leading, 5)
                    }
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 51.0, height: 50.0)
                        .background(Color(white: 1.0))
                        .opacity(0.8008953276134673)
                        .cornerRadius(8.0)
                    ZStack{
                        Image("pin")
                            .foregroundColor(.clear)
                            .frame(width: 17.0, height: 20.0)
                        Rectangle().background(Color.red)         .foregroundColor(.red).frame(width: 8.0, height: 8.0)    .cornerRadius(90).padding(.bottom,15).padding(.leading,13)
                    }
                   
                }
            }.padding(.horizontal, 30)
            ScrollView{
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: .fill)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: .fill)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
                HStack{
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                    
                    Spacer()
                    ZStack{
                        Image("Demo")
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 167.0, height: 210.0)
                            .background(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                                startPoint: UnitPoint(x: 0.5, y: 0.5),
                                endPoint: UnitPoint(x: 0.5, y: 0.9)))
                        VStack{
                            HStack{
                                Text("Steve")
                                    .font(.custom("OpenSansRoman-SemiBold", size: 20.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .frame(width: 53.0, height: 27.0, alignment: .trailing).padding(.trailing)
                                Spacer()
                            }.padding(.horizontal,18)
                            HStack{
                                Image("map")
                                    .foregroundColor(.clear)
                                    .frame(width: 9.9, height: 12.9)
                                Text("California")
                                    .font(.custom("OpenSansRoman-Bold", size: 11.0))
                                    .foregroundColor(Color(white: 1.0))
                                    .textCase(.uppercase)
                                    .kerning(2.8)
                                    .frame(width: 96.0, height: 15.0, alignment: .center)
                                    .opacity(0.7533002580915179)
                            }
                        }.padding(.top,140).padding(.bottom,17)
                    }.opacity(0.8023180280412946).frame(width: 167.0, height: 210.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                        .cornerRadius(24.0)
                }.padding(.top,20)
            }.padding(.horizontal,30)
        }
        .onAppear {
                getProfile()
                getProfileData()
               }
        .navigationBarHidden(true).background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
    }
    private func getProfile() {
        let apiURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/get-user-profile"
       let headers: HTTPHeaders = {
            [
                "accept": "application/json",
                "Authorization": "Bearer \(userModel.user?.access_token ?? "")",
                "Content-Type": "multipart/form-data",
                "X-CSRF-TOKEN": ""
            ]
       }()
        print(apiURL,headers )
        ApiManager.shared.request(
            url: apiURL,
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
        ) { (response: Result<[String: Any], ServerError>) in
            switch response {
            case .success(let json):
                print("profileData\(json)")
                if let userData = json["data"] as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: userData)
                           let decodedProfile = try JSONDecoder().decode(ProfileResponse.self, from: jsonData)
                        _ = decodedProfile.userProfile
                        _ = decodedProfile.location
                        _ = decodedProfile.notification_setting

                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else {
                    print("Data key not found in JSON response")
                }

            case .failure(let error):
                print("Error: \(error)")

            }
            
        }
        }
    private func getProfileData() {
        let apiURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/ptb-profile-card?keyword=''&limit=10&page=10"
       let headers: HTTPHeaders = {
            [
                "accept": "application/json",
                "Authorization": "Bearer \(userModel.user?.access_token ?? "")",
                "Content-Type": "multipart/form-data",
                "X-CSRF-TOKEN": ""
            ]
       }()
        print(apiURL,headers )
        ApiManager.shared.request(
            url: apiURL,
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
        ) { (response: Result<[String: Any], ServerError>) in
            switch response {
            case .success(let json):
                if let apiResponse = json["data"] as? [String: Any],
                   let userMatches = apiResponse["data"] as? [[String: Any]] {
                    for userData in userMatches {
                        if let user = userData["user"] as? [String: Any] {
                            do {
                                let jsonData = try JSONSerialization.data(withJSONObject: user)
                                let decodedUser = try JSONDecoder().decode(SmDashboardUser.self, from: jsonData)
                                print("jsonData Profile: \(decodedUser)")
                                users.append(decodedUser)
                             
                            } catch {
                                print("Error decoding user JSON: \(error)")
                            }
                        }
                    }
                } else {
                    print("Data key not found in JSON response")
                }
            case .failure(let error):
                print("Error: \(error)")

                    }
                }
            }
        }

#Preview {
    SmDashboard(userModel: UserModel())
}
