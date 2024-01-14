//
//  OwnRankingViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 1/12/24.
//

import Foundation
import SwiftUI

final class OwnRankingViewModel: ObservableObject {
    @Published var one2: [Image] = []
    @Published var two2: [Image] = []
    @Published var three2: [Image] = []
    @Published var four2: [Image] = []
    @Published var five2: [Image] = []
}
