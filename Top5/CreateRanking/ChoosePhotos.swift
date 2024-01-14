//
//  ChoosePhotos.swift
//  Top5
//
//  Created by Christian Bingley on 1/10/24.
//

import SwiftUI
import PhotosUI

struct ChoosePhotos: View {
    
    @State public var images: [UIImage] = []
    @State private var photosPickerItems: [PhotosPickerItem] = []
    
    @Binding var title: String
    
    var body: some View {
        ZStack {
            LinearGradientView(color1: .orange, color2: .red)
            
            VStack {
                Text("now, pick your photos")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                PhotosPicker(selection: $photosPickerItems, maxSelectionCount: 15) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .propotionalFrame(width: 0.6, height: 0.07)
                            .opacity(0.2)
                            .cornerRadius(30)

                            Text("Choose photos")
                                .font(.system(.headline, weight: .bold))
                                .propotionalFrame(width: 0.59, height: 0.066)
                                .background(Color.white)
                                .cornerRadius(30)
                                .foregroundColor(.black)
                    }
                }
                
                if !images.isEmpty {
                    ButtonView(nextView: OwnRankingView(title: $title, images: $images), buttonText: "Create!")
                }
            }
            .onChange(of: photosPickerItems) { newPhotosPickerItems in
                Task {
                    for item in newPhotosPickerItems {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                images.append(image)
                            }
                        }
                    }
                    photosPickerItems.removeAll()
                }
            }
        }
    }
}

#Preview {
    let pickTitle = PickTitle()
            
    return ChoosePhotos(title: pickTitle.$title)
}
