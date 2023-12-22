//
//  Dashboard.swift
//  Hera
//
//  Created by KiwiTech on 27/11/23.
//

import SwiftUI
import Alamofire
import URLImage
import CardStack
struct Location: Codable {
    let id: Int
    let state_id: Int
    let user_id: Int
    let zipcode: String
}

struct NotificationSetting: Codable {
    let created_at: String
    let id: Int
    let notify_status: Int
    let updated_at: String
    let user_id: Int
}

struct UserProfile: Codable {
    let bio: String
    let gender_id: Int
    let id: Int
    let occupation: String?
    let relationship_status_id: Int
    let sexual_orientations_id: Int
    let user_id: Int
}

struct UserData: Codable {
    let dob: String
    let email: String
    let email_verified: Int
    let first_name: String
    let id: Int
    let last_name: String
    let location: Location
    let middle_name: String?
    let notification_setting: NotificationSetting
    let phone_no: String
    let role_id: Int
    let subscription: String?
    let upcomingSubscription: String?
    let userProfile: UserProfile
}

struct ProfileResponse: Codable {
    let dob: String
    let email: String
    let email_verified: Int
    let first_name: String
    let id: Int
    let last_name: String
    let location: Location
    let middle_name: String?
    let notification_setting: NotificationSetting
    let phone_no: String
    let role_id: Int
    let subscription: String?
    let upcomingSubscription: String?
    let userProfile: UserProfile
}
//struct DashboardUser: Codable {
//  
//}
struct DashboardUser: Codable, Identifiable {
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
struct CardView: View {
  let user: DashboardUser
    var onSelect: () -> Void
 
    var body: some View {
        Button(action: {
            onSelect()
        }) {  
            ZStack{
              ZStack() {
                  URLImage(url: URL(string: user.profile_pic ) ?? URL(string: "Demo")!) { image in
                      image
                          .foregroundColor(.clear)
                          .frame(width: 266.7, height: 423.4)
                          .background(Color(white: 1.0))
                          .cornerRadius(24.0)
                          .shadow(color: Color(white: 0.0, opacity: 0.15), radius: 18.0, x: 0.0, y: 6.0)
                          .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
                  }
                  Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 266.7, height: 202.2)
                      .background(LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(white: 0.0, opacity: 0.0), location: 0.0),
                            Gradient.Stop(color: Color(white: 0.0), location: 1.0)],
                        startPoint: UnitPoint(x: 0.5, y: 0.1),
                        endPoint: UnitPoint(x: 0.5, y: 0.8)))
                      .offset(x: 0.0, y: 110.6)
              }
              .frame(width: 266.7, height: 400.4)
              .shadow(color: Color(white: 0.0, opacity: 0.07), radius: 24.0, x: 0.0, y: 12.0)
              .offset(x: -0.9, y: 6.6).cornerRadius(24.0)
              VStack{
                  HStack{
                      Image("map")
                          .foregroundColor(.clear)
                          .frame(width: 9.9, height: 12.9)
                      Text(user.state_name)
                          .font(.custom("OpenSansRoman-Bold", size: 11.0))
                          .foregroundColor(Color(white: 1.0))
                          .textCase(.uppercase)
                          .kerning(2.8)
                          .frame( height: 15.0, alignment: .center)
                  }
                  Text("#\(user.username)")
                      .font(.custom("OpenSans", size: 32.0))
                      .foregroundColor(Color(white: 1.0))
                      .frame(height: 43.0, alignment: .center)
                  Text("Sperm Donor, \(user.age) yrs")
                      .font(.custom("OpenSansRoman-Bold", size: 11.0))
                      .foregroundColor(Color(white: 1.0))
                  .frame(width: 111.0, height: 15.0, alignment: .center)}.padding(.top,314).padding(.bottom,30)
          }
      }
  }
}

struct Dashboard: View {
    @State private var isProfile = false
    @State private var isMessage = false
    @State private var isDashboardDetail = false
    @ObservedObject var userModel: UserModel
    @State private var users: [DashboardUser] = []
    @StateObject private var apiManager = ApiManager.shared
    @State private var selectedUserId: Int?
    @State private var currentIndex = 0
    var body: some View {
        VStack {
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
                Button(action: {
                }) {
                    Image("aboutIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 24.0, height: 24.0).cornerRadius(90)}
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
                .frame(width: 202.0, height: 15.0, alignment: .center).padding(.bottom,8)
            HStack{

                Text("Your match might just be a click away!")
                    .font(.custom("OpenSansRoman-Bold", size: 23.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .multilineTextAlignment(.center)
                    .frame(width: 259.0, height: 64.0, alignment: .center)
                Image("UIArrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.clear)
                    .frame(width: 42.0, height: 42.0)
                   }
            ZStack() {
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 220.7, height: 350.3)
                        .background(Color(red: 238.0 / 255.0, green: 170.0 / 255.0, blue: 176.0 / 255.0))
                        .opacity(0.1457359677269345)
                        .cornerRadius(24.0)
                        .rotationEffect(.degrees(-6))
                        .offset(x: -46.0, y: -47.7)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 220.7, height: 350.3)
                        .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                        .opacity(0.2023787725539435)
                        .cornerRadius(24.0)
                        .rotationEffect(.degrees(6))
                        .offset(x: 46.0, y: 47.7)
                }
                .frame(width: 348.0, height: 466.8)
                Spacer()
                CardStack(users, currentIndex: $currentIndex) { item in
                                    CardView(user: item, onSelect: {
                                        selectedUserId = item.id
                                        isDashboardDetail = true
                                    })
                                }
            }
            .frame(width: 348.0, height: 466.8).background(
                NavigationLink(
                    destination: DashboardDetail(userId: selectedUserId ?? 1, userModel: userModel),
                    isActive: $isDashboardDetail
                ) {
                    EmptyView()
                }
            )
         HStack{
             Spacer(minLength: 60)
             Button(action: {
                 handleNotLike()
             }) { ZStack{
                     Rectangle()
                         .foregroundColor(.clear)
                         .frame(width: 110.0, height: 110.0)
                         .background(Color(white: 1.0))
                         .opacity(0.5021420433407738)
                         .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0).cornerRadius(90)
                     Image("NotLike")
                         .frame(width: 100.5, height: 100.5)
                         .background(Color(white: 1.0, opacity: 0.11))
                         .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0)
                 }
                 Spacer()
             }
             
             Button(action: {
                 handleLike()
             }) {
                 ZStack{
                     Rectangle()
                         .foregroundColor(.clear)
                         .frame(width: 110.0, height: 110.0)
                         .background(Color(white: 1.0))
                         .opacity(0.5021420433407738)
                         .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0).cornerRadius(90)
                     Image("Like")
                         .foregroundColor(.clear)
                         .frame(width: 100.5, height: 100.5)
                         .background(Color(white: 1.0, opacity: 0.11))
                         .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0)
                 }
                 Spacer(minLength: 60)
             }
            }.padding(.top,22)
        }
        .onAppear {
                getProfile()
                getProfileData()
               }
        .navigationBarHidden(true).background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
    }
    
    private func handleNotLike() {
           if currentIndex > 0 {
               currentIndex -= 1
           }
       }
       
       private func handleLike() {
           if currentIndex < users.count - 1 {
               currentIndex += 1
           }
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
                print("asad\(json)")
                if let userData = json["data"] as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: userData)
                        print("jsonData Profile: \(jsonData)")
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
        let apiURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/parents-matched-doner"
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
                                      let decodedUser = try JSONDecoder().decode(DashboardUser.self, from: jsonData)
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
    Dashboard(userModel: UserModel())
}

