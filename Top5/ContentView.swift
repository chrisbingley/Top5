//
//  ContentView.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI
import SCSDKCreativeKit

struct ContentView: View {
    
    // vars for snapchat sharing
    @State private var snapImage: UIImage?
    @State private var photoContent: SCSDKPhotoSnapContent?
    
    var body: some View {
        ZStack {
            
            // linear gradient for background (custom view)
            LinearGradientView(color1: .red, color2: .orange)
                VStack {
                    
                    // T5 logo image (custom view)
                    ImageView(imageName: "tf-1", propFrameWidth: 0, propFrameHeight: 0.3)
                        .padding(.top, UIScreen.main.bounds.height * 0.28)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.2)
                    
                    // TESTING INSTAGRAM API (wont actually go here, custom view)
                    //InstagramShareView()
                   
                    // Button to go to next page (custom view)
                    ButtonView(nextView: InstaSignUpView(), buttonText: "Get Started!")
                    
                    // link to go to legal stuff
                    NavigationLink {
                            // legal stuff goes here (url)
                    } label: {
                        Text("legal stuff")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                            .underline()
                }
            }
            // testing out snapchat sharing
            /*
            .onAppear {
                self.snapImage = Image("swift-2").asUIImage()
                self.setupPhotoContent()
            }
             */
        }
    }
    
    // sets up photo content for snap sharing
    func setupPhotoContent() {
           if let snapImage = snapImage {
               let photo = SCSDKSnapPhoto(image: snapImage)
               self.photoContent = SCSDKPhotoSnapContent(snapPhoto: photo)
           }
       }
}

// preview for page
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
