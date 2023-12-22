//
//  DashboardDetail.swift
//  Hera
//
//  Created by KiwiTech on 12/12/23.
//

import SwiftUI
import AVKit
import Alamofire

struct DonorProfile: Decodable {
    let id: Int?
    let username: String?
    let role: String?
    let age: Int?
    let dob: String?
    let role_id: Int?
    let profile_pic: String?
    let subscription_status: Int?
    let user_profile: UserProfile?
    let doner_attribute: DonorAttribute?
    let location: Location?
    let next_step: Bool?
    let doner_photo_gallery: [DonorPhoto]
    let doner_video_gallery: DonorVideo?
    let profile_match_chat: ProfileMatchChat?
    let profile_match_request: String?
    struct UserProfile: Decodable {
        let id: Int?
        let user_id: Int?
        let bio: String?
        let occupation: String?
    }

    struct DonorAttribute: Decodable {
        let id: Int?
        let user_id: Int?
        let education: String?
        let eye_colour: String?
        let father_ethnicity: String?
        let mother_ethnicity: String?
        let weight: String?
        let hair_colour: String?
        let eye_colour_id: Int?
        let father_ethnicity_id: Int?
        let mother_ethnicity_id: Int?
        let weight_id: Int?
        let height: String?
        let race: String?
        let race_id: Int?
        let hair_colour_id: Int?
        let height_id: Int?
        let education_id: String?
    }

    struct Location: Decodable {
        let id: Int?
        let user_id: Int?
        let name: String?
        let state_id: Int?
        let zipcode: String?
    }

    struct DonorPhoto: Decodable {
        let id: Int?
        let user_id: Int?
        let file_name: String?
        let file_type: String?
        let file_url: String?
        let created_at: String?
        let updated_at: String?
        let deleted_at: String?
    }

    struct DonorVideo: Decodable {
        // Define properties for the video gallery if needed
    }

    struct ProfileMatchChat: Decodable {
        let notify_type: String?
        let chat_start: Int?
        let currentRole: Int?
        let deviceToken: String?
        let message: String?
        let msgId: String?
        let read: Int?
        let feedback_status: String?
        let recieverId: String?
        let recieverImage: String?
        let recieverName: String?
        let recieverUserName: String?
        let receiverSubscription: Int?
        let senderId: Int?
        let senderImage: String?
        let senderName: String?
        let senderUserName: String?
        let senderSubscription: Int?
        let status_id: Int?
        let match_request: String?
        let time: Int?
        let type: String?
    }
}

struct DashboardDetail: View {
    let userId: Int
    let videoFileName = "HERAVideo.mp4"
    @ObservedObject var userModel: UserModel
    @State private var donorProfile: DonorProfile?

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView{
            VStack {
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("iconBack")
                            .foregroundColor(.clear)
                            .frame(width: 35.0, height: 35.0).cornerRadius(90)
                        Spacer()
                    }}
                VStack{
                    HStack{
                        VStack{
                            HStack{
                                Image("blueMap")
                                    .foregroundColor(.clear)
                                    .frame(width: 10.9, height: 14.2)
                                Text("California")
                                    .font(.custom("OpenSans", size: 16.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(width: 154.0, height: 21.0, alignment: .leading)
                                Spacer()
                            }
                            HStack{
                                Text("Meryl\nAnderson")
                                    .font(.custom("OpenSansRoman-Bold", size: 32.0))
                                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                    .frame(height: 86.0, alignment: .leading).padding(.top,6)
                                Spacer()
                            }
                        }
                        Spacer()
                        Image("Demo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.clear)
                            .frame(width: 86.1, height: 86.1)
                            .background(Color(white: 216.0 / 255.0))
                            .cornerRadius(100.0)
                            .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0).padding(.bottom,30)
                    }.padding(.top,30)
                    HStack
                    {
                        Text("Parent to be")
                            .font(.custom("OpenSans", size: 20.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame(width: 115.0, height: 27.0, alignment: .leading)
                        Spacer()
                    }
                    HStack
                    {
                        
                        Text({ () -> AttributedString in
                            var string = AttributedString("Age: \(donorProfile?.age) yrs")
                            
                            let _0Range = string.characters.index(string.startIndex, offsetBy: 0)..<string.characters.index(string.startIndex, offsetBy: 4)
                            string[_0Range].font = .custom("OpenSans", size: 16.0)
                            string[_0Range].foregroundColor = Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0)
                            
                            let _1Range = string.characters.index(string.startIndex, offsetBy: 5)..<string.characters.index(string.startIndex, offsetBy: 11)
                            string[_1Range].font = .custom("OpenSansRoman-Bold", size: 16.0)
                            string[_1Range].foregroundColor = Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0)
                            
                            return string
                        }())
                        .frame(width: 84.0, height: 21.0, alignment: .leading)
                        Spacer()
                    }.padding(.bottom,15)
                    ZStack{
                        HStack{
                            Image("comma")
                                .foregroundColor(.clear)
                                .frame(width: 70.2, height: 70.5,alignment: .leading) .offset(y: -80)
                            Spacer()
                        }
                        Text("I give priority to health and play a wide range of sports. I have a good exposure to different cultures of the world. I value the donation programmes & every parent who needs support.")
                            .font(.custom("OpenSansRoman-Light", size: 22.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame(width: 332.0,  alignment: .leading)
                    }.padding(.top,39)
                    HStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 60.0, height: 31.0)
                                .background(Color(red: 229.0 / 255.0, green: 172.0 / 255.0, blue: 177.0 / 255.0))
                                .opacity(0.2871558779761905)
                            Text("Female")
                                .font(.custom("OpenSans", size: 14.0))
                                .foregroundColor(Color(white: 0.0))
                                .frame(width: 48.0, height: 21.0, alignment: .center)
                        }
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 92.0, height: 31.0)
                                .background(Color(red: 229.0 / 255.0, green: 172.0 / 255.0, blue: 177.0 / 255.0))
                                .opacity(0.2871558779761905)
                            Text("Hetrosexual")
                                .font(.custom("OpenSans", size: 14.0))
                                .foregroundColor(Color(white: 0.0))
                            .frame(width: 80.0, height: 21.0, alignment: .center)                    }
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 64.0, height: 31.0)
                                .background(Color(red: 229.0 / 255.0, green: 172.0 / 255.0, blue: 177.0 / 255.0))
                                .opacity(0.2871558779761905)
                            Text("Married")
                                .font(.custom("OpenSans", size: 14.0))
                                .foregroundColor(Color(white: 0.0))
                                .frame(width: 52.0, height: 21.0, alignment: .center)
                        }
                        Spacer()
                    }.padding(.horizontal).padding(.top,15)
                    HStack{
                        Text("Parent has uploaded a short clip")
                            .font(.custom("OpenSansRoman-Bold", size: 14.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame(width: 226.0, height: 19.0, alignment: .center)
                        Spacer()
                    }.padding(.top,30)
                    if let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: nil) {
                        
                        VideoPlayerView(videoURL: videoURL)
                            .frame(height: 300)
                            .onAppear {
                                // Optionally, play the video when the view appears
                                AVPlayerViewControllerManager.shared.play()
                            }
                    } else {
                        Text("Video not found.")
                    }
                    HStack{
                        Image("greenHeart")
                            .foregroundColor(.clear)
                            .frame(width: 22.7, height: 20.9)
                        Text("You had matched on Sep 4, 2021")
                            .font(.custom("OpenSans-Italic", size: 15.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame( height: 20.0, alignment: .center)
                        Spacer()
                    }.padding(.top,20).padding(.horizontal)
                    Button(action: {
                        
                    }) { ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 305.0, height: 80.0)
                            .background(Color(red: 163.0 / 255.0, green: 198.0 / 255.0, blue: 196.0 / 255.0))
                            .cornerRadius(40.0)
                        Text("REQUEST FOR A PAYMENT")
                            .font(.custom("OpenSans-Bold", size: 14.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .multilineTextAlignment(.center)
                            .kerning(1.8)
                            .frame(height: 19.0, alignment: .center)
                    }
                    }.padding(.top,20)
                }
            }
            .padding(.horizontal,30)
                .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0))
        }
        .onAppear {
            fetchDonorProfileDetails(userId: userId)
               }
        
        .navigationBarHidden(true)  .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
    }
    func parseDonorProfile(_ response: [String: Any]) -> DonorProfile? {
        guard let data = response["data"] as? [String: Any] else {
            // Handle the absence of "data" key in the API response
            return nil
        }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let decoder = JSONDecoder()
            let donorProfile = try decoder.decode(DonorProfile.self, from: jsonData)
            print("donorProfile\(donorProfile)")
            return donorProfile
        } catch {
            // Handle parsing errors
            print("Error parsing donor profile: \(error)")
            return nil
        }
    }
    private func fetchDonorProfileDetails(userId: Int) {
        let apiURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/doner-profile-details?user_id=\(userId)"
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
                print("Donor Profile Details: \(json)")
                donorProfile = parseDonorProfile(json)
            case .failure(let error):
                print("Error: \(error)")

            }
            
        }
        }
}


#Preview {
    DashboardDetail(userId: 123, userModel: UserModel())
}
