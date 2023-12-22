//
//  LoginView.swift
//  Hera
//
//  Created by KiwiTech on 22/11/23.
//

import SwiftUI
import Alamofire
import SimpleToast

struct User: Codable {
    let access_token: String
    let refresh_token: String?
    let first_name: String?
    let last_name: String?
    let profile_pic: String?
    enum CodingKeys: String, CodingKey {
        case access_token
        case refresh_token
        case first_name
        case last_name
        case profile_pic
    }
}

class UserModel: ObservableObject {
    @Published var user: User? {
        didSet {
            print("User updated: \(user)")
        }
    }
}
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isDashboard = false
    @State private var isSmDashboard = false
    @State private var isNavigate = false
    @State private var showToast = false
    @State private var errorText = ""
    @State private var isError = true
    @StateObject private var userModel = UserModel()
    @StateObject private var apiManager = ApiManager.shared
    @Environment(\.presentationMode) var presentationMode
    private let toastOptions = SimpleToastOptions(
           hideAfter: 5
       )
    func getName(isDashboard: Bool) -> some View {
        if isDashboard {
            return AnyView(Dashboard(userModel: userModel))
        } else {
            return AnyView(SmDashboard(userModel: userModel))
        }
    } 
    
    var body: some View {
        VStack {
            
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 35.0, height: 35.0)
                            .background(Color(red: 229.0 / 255.0, green: 227.0 / 255.0, blue: 214.0 / 255.0))
                            .opacity(0.7999999523162842)
                            .cornerRadius(35.0 / 2)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 2.4, height: 14.6)
                            .background(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .cornerRadius(2.0)
                            .rotationEffect(.degrees(-45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 2.4, height: 14.6)
                            .background(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .cornerRadius(2.0)
                            .rotationEffect(.degrees(-145))
                    }}
            Image("Splash")
                .foregroundColor(.clear)
                .frame(width: 173.6, height: 133.0).padding(.top,94).padding(.leading, -60)
            VStack{
                FloatingLabelTextField(text: $username,label: "Mobile Number")
                FloatingLabelTextField( text: $password,label: "Password",Password:true).padding(.top,30)
                NavigationLink(
                    destination: isDashboard ? AnyView(Dashboard(userModel: userModel)) : AnyView(SmDashboard(userModel: userModel)),
                    isActive: $isNavigate
                ) {
                    Button(action: {
                        performLogin()
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
                    }.padding(.top,56)
                }
                
                Text("Forgot Your Password?")
                    .font(.custom("OpenSans-Bold", size: 16.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .underline()
                    .frame(width: 183.0, height: 22.0, alignment: .center).padding(.top,40)
            }.padding(.horizontal,20).padding(.top,65)
            
            
            ZStack{
                if apiManager.isLoading {
                    ActivityIndicator()
                }
            }.offset(y:-UIScreen.main.bounds.height / 2)
            Spacer()
        }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            Toast(showToast: $showToast, isError: $isError, toastText: $errorText)
        }
        .navigationBarHidden(true)
        .padding(.horizontal,20)
        .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
    }
    private func performLogin() {
        let apiURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/login"
        let parameters: [String: Any] = [
            "country_code": "+1",
            "phone_no": username,
            "password": password
        ]
           let headers: HTTPHeaders = [
               "accept": "application/json",
               "Content-Type": "application/json",
               
           ]
        print(apiURL,parameters,headers )
        ApiManager.shared.request(
            url: apiURL,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        ) { (response: Result<[String: Any], ServerError>) in
            switch response {
            case .success(let json):
                print("asad\(json)")
                showToast=true
                isError=false
                errorText=json["message"] as! String
                if let userData = json["data"] as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: userData)
                        print("userRole \(userData["role_id"] ?? "Role ID not found")")
                        
                        let decodedUser = try JSONDecoder().decode(User.self, from: jsonData)
                        print("JSON Data: \(jsonData)")
                        print("Decoded User: \(decodedUser)")
                        userModel.user = decodedUser
                        isNavigate=true
                        if let roleID = userData["role_id"] as? Int, roleID == 2 {
                            isDashboard = true
                        } else {
                            isSmDashboard = true
                        }

                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else {
                    print("Data key not found in JSON response")
                }

            case .failure(let error):
                print("Error: \(error)")
                showToast=true
                errorText=error.message
                
            }
            
        }
        }
}

// Preview code
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserModel()) 
    }
}
