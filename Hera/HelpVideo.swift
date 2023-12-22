//
//  HelpVideo.swift
//  Hera
//
//  Created by KiwiTech on 08/12/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update UI if needed
    }
}
struct HelpVideo: View {
    @Environment(\.presentationMode) var presentationMode
    let videoFileName = "HERAVideo.mp4"
    var body: some View {
        VStack {
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                    Image("iconBack")
                        .foregroundColor(.clear)
                        .frame(width: 35.0, height: 35.0).cornerRadius(90).padding(.horizontal,40)
                    Spacer()
                    }}.padding(.top, 80)
            Text("See Help Video")
                .font(.custom("OpenSansRoman-Bold", size: 11.0))
                .foregroundColor(Color(red: 53.0 / 255.0, green: 58.0 / 255.0, blue: 58.0 / 255.0))
                .textCase(.uppercase)
                .kerning(2.8).padding(.bottom, 80)
                .frame(alignment: .center).padding(.top,16)
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
            Spacer()
       
        } .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 240.0 / 255.0))
            .frame(width: 414.0, height: 896.0)

    }
    
}


// AVPlayerViewControllerManager to manage playback state
class AVPlayerViewControllerManager {
    static let shared = AVPlayerViewControllerManager()

    private var avPlayerViewController: AVPlayerViewController?

    private init() {}

    func play() {
        avPlayerViewController?.player?.play()
    }

    func pause() {
        avPlayerViewController?.player?.pause()
    }
}

#Preview {
    HelpVideo()
}
