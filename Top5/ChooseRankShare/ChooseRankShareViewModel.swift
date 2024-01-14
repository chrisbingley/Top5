//
//  ChooseRankShareViewModel.swift
//  Top5
//
//  Created by Christian Bingley on 8/4/23.
//

import Foundation

final class ChooseRankShareViewModel: ObservableObject {
    @Published var isCycleComplete = false
    
    @Published var imageName = "choose"
    @Published var textName = "choose."
    @Published var theFillOrStroke1 = "fill"
    @Published var theFillOrStroke2 = "stroke"
    @Published var theFillOrStroke3 = "stroke"
    
    func update() {
            if imageName == "choose" {
                imageName = "rank"
                textName = "rank."
                theFillOrStroke1 = "stroke"
                theFillOrStroke2 = "fill"
                theFillOrStroke3 = "stroke"
            } else if imageName == "rank" {
                imageName = "share"
                textName = "share."
                theFillOrStroke1 = "stroke"
                theFillOrStroke2 = "stroke"
                theFillOrStroke3 = "fill"
            } else {
                isCycleComplete = true
            }
        }
}
