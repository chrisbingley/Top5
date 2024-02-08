//
//  PickTitle.swift
//  Top5
//
//  Created by Christian Bingley on 1/10/24.
//

import SwiftUI

struct PickTitle: View {
    @State public var title: String = ""
    var body: some View {
        ZStack {
            LinearGradientView(color1: .orange, color2: .red)
            
            VStack {
                BackButtonView()
                    .offset(x: UIScreen.main.bounds.width * -0.34, y: UIScreen.main.bounds.height * -0.275 )
                
                Text("what are you ranking?")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                CharacterLimitedTextField(text: $title, characterLimit: 30)
                    .propotionalFrame(width: 0.6, height: 0.07)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.25))
                    .cornerRadius(30)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .padding(UIScreen.main.bounds.height * 0.025)
                
                ButtonView(nextView: ChoosePhotos(title: $title), buttonText: "Next")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PickTitle()
}
