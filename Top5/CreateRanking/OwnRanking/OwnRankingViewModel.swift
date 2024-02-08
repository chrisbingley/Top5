//
//  OwnRankingViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 1/12/24.
//

import Foundation
import SwiftUI

final class OwnRankingViewModel: ObservableObject {
    
    @Published var daCount: Int = 1
    
    @Published var one2: [Image] = []
    @Published var two2: [Image] = []
    @Published var three2: [Image] = []
    @Published var four2: [Image] = []
    @Published var five2: [Image] = []
    
    // CHANGEEEEEEEEEEEEEEEEE
    var imageToSave = SwiftRankingView()
    
    @Published var showShareButton: Bool = false
    @Published var showDoneButton: Bool = true
    
    @Published var showingBox = true
    
    @Published var showModal = false
    
    @Published var showingSnap = true
    @Published var showingInsta = false
    @Published var showingTikTok = false
    
    var areAllNumAndImageViewsFilled: Bool {
            let numAndImageViews = [one2, two2, three2, four2, five2]
            return numAndImageViews.allSatisfy { !$0.isEmpty }
        }
    
    func changeDaCount() {
        if daCount > 3 {
            daCount = 1
        } else {
            daCount += 1
        }
    }
}
