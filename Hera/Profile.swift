//
//  Profile.swift
//  Hera
//
//  Created by KiwiTech on 29/11/23.
//

import SwiftUI
import URLImage
import AVFoundation
import Photos
import Alamofire
import SimpleToast
struct Profile: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSwitch = false
    @State private var isLogout = false
    @ObservedObject var userModel: UserModel
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage? = nil
    @State private var showToast = false
    @State private var errorText = "Profile Picture has been updated successfully."
    @State private var isError = true
    @StateObject private var apiManager = ApiManager.shared
    private let toastOptions = SimpleToastOptions(
           hideAfter: 5
       )
    enum SheetType {
            case camera, gallery
        }
    @State private var isSheetPresented = false
    @State private var isHelpVideo = false
    @State private var selectedSourceType: UIImagePickerController.SourceType?
    var body: some View {
        ScrollView {
            VStack {
                ZStack{
                    if apiManager.isLoading {
                        ActivityIndicator()
                    }
                }.offset(y:UIScreen.main.bounds.height / 2)
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("iconBack")
                            .foregroundColor(.clear)
                            .frame(width: 35.0, height: 35.0).cornerRadius(90)
                        Spacer()
                    }}
                ZStack() {
                    URLImage(url: URL(string: userModel.user?.profile_pic ?? "https://live.ece.utexas.edu/research/img_qual_zhou/demo_tiffany_files/Image51.gif") ?? URL(string: "profile")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.clear)
                            .frame(width: 86.1, height: 86.1)
                            .background(Color(white: 216.0 / 255.0))
                            .cornerRadius(100.0)
                        .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)}
                    Button(action: {
                        isSheetPresented.toggle()
                    }) {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                            
                                .frame(width: 40, height:30)
                            Image("camera")
                                .foregroundColor(.clear)
                                .frame(width: 17.0, height: 14.0)
                        }
                    }.offset(x: 26.0, y: 30.0)
                        .actionSheet(isPresented: $isSheetPresented) {
                            ActionSheet(
                                title: Text("Select Image Source"),
                                buttons: [
                                    .default(Text("Camera")) {
                                        selectedSourceType = .camera
                                        isSheetPresented = false
                                    },
                                    .default(Text("Gallery")) {
                                        selectedSourceType = .photoLibrary
                                        isSheetPresented = false
                                    },
                                    .cancel()
                                ]
                            )
                        }
                }
                .frame(width: 86.1, height: 86.1)
                .shadow(color: Color(white: 0.0, opacity: 0.17), radius: 34.0, x: 0.0, y: 2.0)
                Text("\(userModel.user?.first_name ?? "User") \(userModel.user?.last_name ?? "")")
                    .font(.custom("OpenSans-Bold", size: 24.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .frame(width: 191.0, height: 33.0, alignment: .center).padding(.top,25)
                Text("INTENDED PARENT")
                    .font(.custom("OpenSans-Bold", size: 11.0))
                    .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .kerning(2.8)
                    .frame(width: 146.0, height: 15.0, alignment: .center).padding(.top,8)
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 354.0, height: 115.0)
                        .background(Color(white: 1.0))
                        .cornerRadius(11.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 11.0)
                                .inset(by: 1.0)
                                .stroke(Color(red: 163.0 / 255.0, green: 198.0 / 255.0, blue: 196.0 / 255.0), lineWidth: 2.0)
                        )
                    VStack{
                        HStack{
                            Image("subs")
                                .foregroundColor(.clear)
                                .frame(width: 12.3, height: 11.8,alignment: .trailing).padding(.leading,30)
                            Text("Free Trial for 7 days")
                                .font(.custom("OpenSans-Bold", size: 16.0))
                                .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                .frame(width: 157.0, height: 22.0, alignment: .leading)
                            Spacer()
                        }
                        Text("Jan 12, 2023 onwards, subscription will be mandatory to use the services.")
                            .font(.custom("OpenSans", size: 16.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame(width: 308.0, height: 44.0, alignment: .center)
                    }
                }.padding(.vertical,30)
                HStack{
                    Image("Edit")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Edit Preference")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                HStack{
                    Image("HeraPay")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("HERA Pay")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame(alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                HStack{
                    Image("short")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Add a Short Video")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 12.0, height: 12.0)
                        .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                        .overlay(
                            Rectangle()
                                .inset(by: -0.5)
                                .stroke(Color(white: 1.0), lineWidth: 1.0)
                        ).cornerRadius(90)
                }.padding(.bottom,35)
                HStack{
                    Image("person")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Edit Profile")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 12.0, height: 12.0)
                        .background(Color(red: 152.0 / 255.0, green: 200.0 / 255.0, blue: 194.0 / 255.0))
                        .overlay(
                            Rectangle()
                                .inset(by: -0.5)
                                .stroke(Color(white: 1.0), lineWidth: 1.0)
                        ).cornerRadius(90)
                    
                }.padding(.bottom,35)
                HStack{
                    Image("settings")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Settings")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                VStack{
                    HStack{
                        Image("Notification")
                            .foregroundColor(.clear)
                            .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                        VStack{
                            Text("Receive Notifications")
                                .font(.custom("OpenSans-Bold", size: 16.0))
                                .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                                .frame( alignment: .center)
                        }
                        Spacer()
                        Toggle(isOn: $isSwitch) {
                            
                        }
                    }
                    Text({ () -> AttributedString in
                        var string = AttributedString("*You can choose to turn off notifications. \nHowever, you will still receive subscription \nnotifications.")
                        
                        let _0Range = string.characters.index(string.startIndex, offsetBy: 0)..<string.characters.index(string.startIndex, offsetBy: 1)
                        string[_0Range].font = .custom("OpenSans", size: 14.0)
                        string[_0Range].foregroundColor = Color(red: 1.0, green: 83.0 / 255.0, blue: 83.0 / 255.0)
                        
                        let _1Range = string.characters.index(string.startIndex, offsetBy: 1)..<string.characters.index(string.startIndex, offsetBy: 104)
                        string[_1Range].font = .custom("OpenSans", size: 14.0)
                        string[_1Range].foregroundColor = Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0)
                        
                        return string
                    }())
                    .frame(width: 279.0, alignment: .leading)
                    
                }.padding(.bottom,35)
                
                HStack{
                    Image("Support")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Support")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                NavigationLink(
                    destination: HelpVideo(),
                    isActive: $isHelpVideo
                ) {
                    Button(action: {
                        isHelpVideo=true
                    }) {
                    HStack{
                        Image("HelpVideo")
                            .foregroundColor(.clear)
                            .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                        Text("See Help Video")
                            .font(.custom("OpenSans-Bold", size: 16.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .frame( alignment: .center)
                        Spacer()
                    }.padding(.bottom,35)
                }
            }
                HStack{
                    Image("Info")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("About Us")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                HStack{
                    Image("Terms")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Terms and Conditions")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
                HStack{
                    Image("Policy")
                        .foregroundColor(.clear)
                        .frame(width: 12.3, height: 11.8).padding(.trailing,18)
                    Text("Privacy Policy")
                        .font(.custom("OpenSans-Bold", size: 16.0))
                        .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                        .frame( alignment: .center)
                    Spacer()
                }.padding(.bottom,35)
               
                NavigationLink(
                    destination: AuthScreen(),
                    isActive: $isLogout
                ) {
                    Button(action: {
                        isLogout=true
                    }) {ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 143.8, height: 59.0)
                            .background(Color(red: 241.0 / 255.0, green: 140.0 / 255.0, blue: 146.0 / 255.0))
                            .opacity(0.7482328869047619)
                            .cornerRadius(40.0)
                        Text("LOG OUT")
                            .font(.custom("OpenSans-Bold", size: 13.0))
                            .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                            .multilineTextAlignment(.center)
                            .kerning(1.7)
                            .frame( height: 18.0, alignment: .center)
                    }.padding(.top,12)}}
                Text("App Version 0.5")
                    .font(.custom("OpenSans", size: 14.0))
                    .foregroundColor(Color(white: 158.0 / 255.0))
                    .frame( alignment: .center).padding(.top,25)

            }.padding(.horizontal,30)
            
                .frame(width: 414.0, height: 1287.0)
                .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0))
        }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            Toast(showToast: $showToast, isError: $isError, toastText: $errorText)
        }
        .navigationBarHidden(true)  .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0).edgesIgnoringSafeArea(.all))
        if let selectedSourceType = selectedSourceType {
            ImagePicker(selectedImage: $selectedImage, presentationMode: presentationMode, isSheetPresented: $isSheetPresented, sourceType: selectedSourceType,userModel:userModel,showToast: $showToast,
                        isError: $isError,
                        errorText: $errorText )
              }
    }

    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(userModel: UserModel())
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var presentationMode: PresentationMode
    @Binding var isSheetPresented :Bool
    var sourceType: UIImagePickerController.SourceType
    var userModel: UserModel
    @Binding var showToast: Bool
    @Binding var isError: Bool
    @Binding var errorText: String

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        var userModel: UserModel
        var showToast: Binding<Bool>
        var isError: Binding<Bool>
        var errorText: String
        private let updateProfilePicURL = "https://mbc-dev-backend-new.kiwi-internal.com/api/v1/update-profile-pic"
             private var headers: HTTPHeaders {
                 [
                     "accept": "application/json",
                     "Authorization": "Bearer \(userModel.user?.access_token ?? "")",
                     "Content-Type": "multipart/form-data",
                     "X-CSRF-TOKEN": ""
                 ]
             }

        init(parent: ImagePicker, userModel: UserModel, showToast: Binding<Bool>, isError: Binding<Bool>, errorText: String) {
                    self.parent = parent
                    self.userModel = userModel
                    self.errorText = errorText
                    self.showToast = showToast
                    self.isError = isError
                    super.init()
                }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
                updateProfilePicture(image: uiImage)
                print("Selected Image URI: \(info[.imageURL] as? URL ?? URL(fileURLWithPath: ""))")
            }
            func updateProfilePicture(image: UIImage) {
                  // Convert UIImage to Data
                  guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                      print("Failed to convert image to data.")
                      return
                  }

                  // Create multipart form data
                  let formData = MultipartFormData()
                  formData.append(imageData, withName: "file", fileName: "profile_picture.jpg", mimeType: "image/jpeg")

                  // Make the API request
                  AF.upload(multipartFormData: formData, to: updateProfilePicURL, method: .post, headers: headers)
                      .responseJSON { response in
                          switch response.result {
                          case .success(let json):
                              if let dict = json as? [String: Any], let message = dict["message"] as? String {
                                  DispatchQueue.main.async {
                                                      self.showToast.wrappedValue = true
                                                      self.isError.wrappedValue = false
                                      self.errorText = message
                                      
                                      print("Updated errorText: \(self.errorText)")
                                                  }
                                                 print("Update Profile Picture Response: \(message)")
                                                 // Handle the message as needed
                                             } else {
                                                 print("Unexpected JSON format")
                                             }                              // Handle success, if needed
                          case .failure(let error):
                              self.showToast.wrappedValue = true
                              self.isError.wrappedValue=true
                              self.errorText="Error updating profile picture. Please try again"
                              print("Error updating profile picture: \(error)")
                              // Handle failure, if needed
                          }
                      }
              }
            print("Uploaded\(info)")
//            parent.$presentationMode.wrappedValue.dismiss()
             
             // Set isSheetPresented to false to prevent the action sheet from reappearing
             parent.isSheetPresented = false
            
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Cancel")
            
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self, userModel: userModel,showToast: $showToast, isError: $isError,errorText: errorText)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        if isSheetPresented {
            // Ask for permission and present the image picker
            context.coordinator.checkPermissionAndPresentPicker(sourceType: sourceType)
        }
    }
}

extension ImagePicker.Coordinator {
    func checkPermissionAndPresentPicker(sourceType: UIImagePickerController.SourceType) {
        switch sourceType {
        case .camera:
            checkCameraPermission { isAuthorized in
                if isAuthorized {
                    self.presentImagePicker(sourceType: sourceType)
                }
            }
        case .photoLibrary:
            checkPhotoLibraryPermission { isAuthorized in
                if isAuthorized {
                    self.presentImagePicker(sourceType: sourceType)
                }
            }
        default:
            break
        }
    }

    private func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status {
            case .authorized:
                completion(true)
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    completion(granted)
                }
            default:
                completion(false)
            }
        } else {
            completion(false)
        }
    }

    private func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                completion(status == .authorized)
            }
        default:
            completion(false)
        }
    }

    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType

        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(picker, animated: true, completion: nil)
        }
    }
}
