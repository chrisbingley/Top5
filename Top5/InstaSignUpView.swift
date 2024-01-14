//
//  InstaSignUpView.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI
import SCSDKLoginKit
import UIKit

struct InstaSignUpView: View {
    
    // vars for instagram username
    @State private var instaUsername: String = ""
    @State private var username: String = ""
    let characterLimit = 30
    
    var body: some View {
            ZStack {
                
                // gradient background
                LinearGradientView(color1: .red, color2: .orange)
                
                VStack {
                    
                    VStack {
                        // T5 logo
                        ImageView(imageName: "tf-1", propFrameWidth: 0.25, propFrameHeight: 0.25)
                        
                        Text("Connect to Snapchat")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        SnapchatLoginView()
                            .offset(x: UIScreen.main.bounds.width * 0.2)
                    }
                    .offset(y: 100)
                    
                    VStack {
                        Text("what's your Instagram username? 🤔")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        // text field that limits characters to max length of insta usernames
                        CharacterLimitedTextField(text: $instaUsername, characterLimit: characterLimit)
                            .propotionalFrame(width: 0.6, height: 0.07)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.25))
                            .cornerRadius(30)
                            .multilineTextAlignment(.center)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .padding(UIScreen.main.bounds.height * 0.025)
                        
                        // if insta username not filled out, can go to next view, if not, grays out and disables button
                        if !instaUsername.isEmpty {
                            ButtonView(nextView: OverallPickRanking(), buttonText: "Next")
                        } else {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .propotionalFrame(width: 0.6, height: 0.07)
                                    .opacity(0.2)
                                    .cornerRadius(30)
                                
                                Button {
                                    // link goes nowhere
                                } label: {
                                    Text("Next")
                                        .font(.system(.headline, weight: .bold))
                                        .propotionalFrame(width: 0.59, height: 0.066)
                                        .background(Color.gray)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                }
                                .opacity(0.1)
                                .disabled(true)
                            }
                        }
                    }
                    .offset(y: -100)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

struct SnapchatLoginView: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let loginButton = SCSDKLoginButton { success, error in
            guard success, error == nil else { return }
        }
        loginButton.sizeToFit()

        let wrapperView = UIView()
        wrapperView.addSubview(loginButton)

        return wrapperView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}

struct InstaSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        InstaSignUpView()
    }
}
