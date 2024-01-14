//
//  InstagramShareView.swift
//  Top5
//
//  Created by Christian Bingley on 12/29/23.
//

import SwiftUI

struct InstagramShareView: View {

  var imageToShare: Image {
    // random image from assets
    return Image("swift-1")
  }

  var body: some View {
    VStack {

      // display the image that will be shared to insta
      imageToShare
        .resizable()
        .aspectRatio(contentMode: .fit)
        .propotionalFrame(width: 0.3, height: 0.12)

    // shares image to story if it can be opened
      if InstagramSharingUtils.canOpenInstagramStories {
          imageToShare
          Button(action: { InstagramSharingUtils.shareToInstagramStories(imageToShare.asUIImage()) }) {
          Text("Share to Instagram Stories")
        }
      } else {
        Text("Instagram is not available.")
      }
    }
  }
}
