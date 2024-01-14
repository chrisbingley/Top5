//
//  SwiftRankingViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import Foundation
import SwiftUI

final class SwiftRankingViewModel: ObservableObject {
    
    var imageToSave = SwiftRankingView()
    
    @Published var one: [Album] = []
    @Published var two: [Album] = []
    @Published var three: [Album] = []
    @Published var four: [Album] = []
    @Published var five: [Album] = []
    
    @Published var theAlbums: [Album] = [Album(id: UUID(), albumName: "the_ratty"), Album(id: UUID(), albumName: "jos"), Album(id: UUID(), albumName: "andrews"), Album(id: UUID(), albumName: "vdub"), Album(id: UUID(), albumName: "swift-2")]
    
    @Published var colorState: ColorState = .redToOrange
    
    @Published var blueToPink = LinearGradient(colors: [.blue, .pink], startPoint: .bottomLeading, endPoint: .topTrailing)
    @Published var whiteToBlue = LinearGradient(colors: [.white, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
    
    @Published var showModal = false
    
    @Published var showingSnap = true
    @Published var showingInsta = false
    @Published var showingTikTok = false
    
    @Published var showingBox = true
    
    @Published var showShareButton: Bool = false
    @Published var showDoneButton: Bool = true
    
    @Published var daCount: Int = 1
    
    var areAllNumAndImageViewsFilled: Bool {
            let numAndImageViews = [one, two, three, four, five]
            return numAndImageViews.allSatisfy { !$0.isEmpty }
        }
    
    func changeColor() {
        withAnimation {
            switch colorState {
                case .redToOrange:
                    colorState = .blueToPink
                case .blueToPink:
                    colorState = .whiteToBlue
                case .whiteToBlue:
                    colorState = .redToOrange
            }
        }
    }
    
    func getLinearGradient() -> LinearGradient {
        switch colorState {
            case .redToOrange:
                return LinearGradient(colors: [.red, .orange], startPoint: .bottomLeading, endPoint: .topTrailing)
            case .blueToPink:
                return blueToPink
            case .whiteToBlue:
                return whiteToBlue
        }
    }
    
    func changeDaCount() {
        if daCount > 3 {
            daCount = 1
        } else {
            daCount += 1
        }
    }
}
