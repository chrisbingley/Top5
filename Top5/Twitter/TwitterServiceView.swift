//
//  TwitterServiceView.swift
//  Top5
//
//  Created by Christian Bingley on 1/6/24.
//

import SwiftUI

struct TwitterServiceView: View {
    @StateObject var viewModel = TwitterServiceViewModel(
        tweetService: TweetService()
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My tweet drafter")
                .font(.title)
            
            TextField(
                "Type your amazing non-toxic tweet",
                text: $viewModel.text
            )
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(16)
            
            Button {
                viewModel.onTapTweet()
            } label: {
                Text("Tweet")
                   .bold()
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color.accentColor)
                   .foregroundColor(.white)
                   .cornerRadius(16)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TwitterServiceView()
}
