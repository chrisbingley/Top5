//
//  TwitterServiceViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 1/6/24.
//

import Foundation

@MainActor
final class TwitterServiceViewModel: ObservableObject {
    @Published var text: String = ""
    
    let tweetService: TweetServiceProviding
    
    init(tweetService: TweetServiceProviding) {
        self.tweetService = tweetService
    }
    
    func onTapTweet() {
        self.tweetService.tweet(text: self.text)
    }
}
