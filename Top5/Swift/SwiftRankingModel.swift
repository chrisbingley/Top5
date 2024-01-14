//
//  SwiftRankingModel.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct Album: Codable, Hashable, Transferable {
    var id: UUID = UUID()
    var albumName: String = ""
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .albumsView)
    }
}

extension UTType {
    static let albumsView = UTType(exportedAs: "Christian-Bingley.Top5")
}

extension View {
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.backgroundColor = .clear
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

 enum ColorState {
     case redToOrange
     case blueToPink
     case whiteToBlue
 }
 
