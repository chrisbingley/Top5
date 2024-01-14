//
//  UziRankingModel.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct UziSong: Codable, Hashable, Transferable {
    var id: UUID = UUID()
    var songName: String = ""
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .uziSong)
    }
}

extension UTType {
    static let uziSong = UTType(exportedAs: "Christian-Bingley.Top5")
}
