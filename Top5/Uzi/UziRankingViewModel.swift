//
//  UziRankingViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import Foundation
import SwiftUI

final class UziRankingViewModel: ObservableObject {
    
    @Published var daCount: Int = 1
    
    @Published var showShareButton: Bool = false
    @Published var showDoneButton: Bool = true
    
    @Published var one2: [UziSong] = []
    @Published var two2: [UziSong] = []
    @Published var three2: [UziSong] = []
    @Published var four2: [UziSong] = []
    @Published var five2: [UziSong] = []
    
    @Published var theAlbums2: [UziSong] = [UziSong(id: UUID(), songName: "Flooded The Face"), UziSong(id: UUID(), songName: "Suicide Doors"), UziSong(id: UUID(), songName: "Aye"), UziSong(id: UUID(), songName: "Crush Em"), UziSong(id: UUID(), songName: "Amped"), UziSong(id: UUID(), songName: "x2"), UziSong(id: UUID(), songName: "Died and Came Back"), UziSong(id: UUID(), songName: "Spin Again"), UziSong(id: UUID(), songName: "That Fiya"), UziSong(id: UUID(), songName: "I Gotta"), UziSong(id: UUID(), songName: "Endless Fashion"), UziSong(id: UUID(), songName: "Mama, I'm Sorry"), UziSong(id: UUID(), songName: "All Alone"), UziSong(id: UUID(), songName: "Nakamura"), UziSong(id: UUID(), songName: "Just Wanna Rock"), UziSong(id: UUID(), songName: "Fire Alarm"), UziSong(id: UUID(), songName: "CS"), UziSong(id: UUID(), songName: "Werewolf"), UziSong(id: UUID(), songName: "Pluto to Mars"), UziSong(id: UUID(), songName: "Patience"), UziSong(id: UUID(), songName: "Days Come and Go"), UziSong(id: UUID(), songName: "Rehab"), UziSong(id: UUID(), songName: "The End"), UziSong(id: UUID(), songName: "Zoom"), UziSong(id: UUID(), songName: "Of Course"), UziSong(id: UUID(), songName: "Shardai")]
    
    
    var areAllNumAndImageViewsFilled: Bool {
            let numAndImageViews = [one2, two2, three2, four2, five2]
            return numAndImageViews.allSatisfy { !$0.isEmpty }
    }
    
    let songNames = ["Flooded The Face", "Suicide Doors", "Aye", "Crush Em", "Amped", "x2", "Died and Came Back", "Spin Again", "That Fiya", "I Gotta", "Endless Fashion", "Mama, I'm Sorry", "All Alone", "Nakamura", " Just Wanna Rock", "Fire Alarm", "CS", "Werewolf", "Pluto to Mars", "Patience", "Days Come and Go", "Rehab", "The End", "Zoom", "Of Course", "Shardai"]
}
