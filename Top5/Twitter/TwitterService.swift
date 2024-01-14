//
//  TwitterService.swift
//  Top5
//
//  Created by Christian Bingley on 1/6/24.
//

import Foundation
import SwiftUI

protocol TweetServiceProviding {
    func tweet(text: String)
}

final class TweetService: TweetServiceProviding {
    func tweet(text: String) {
        // 1. Build Tweet String
        guard let tweet = text
            .addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed
            ) else {
            return
        }
        
        // 2. Build URL
        /*
        guard let appUrl = URL(string: "twitter://post?message=\(tweet)") else {
            return
        }
         */
        
        guard let appUrl = URL(string: "twitter://post?image=\(tweet)") else {
            return
        }
        
        // 3. Open the Twitter app
        let application = UIApplication.shared
        application.open(appUrl)
    }
}
