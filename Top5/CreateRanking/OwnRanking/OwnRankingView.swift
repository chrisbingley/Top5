//
//  OwnRankingView.swift
//  Top5
//
//  Created by Christian Bingley on 1/12/24.
//

import SwiftUI

struct OwnRankingView: View {
    @StateObject private var viewModel = OwnRankingViewModel()
    
    // ON CLICK OF BACK BUTTON CALL FUNCTION TO CLEAR IMAGES LIST
    
    @Binding var title: String
    @Binding var images: [UIImage]
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                NumAndImageView3(number: 1, boxToPutIn: $viewModel.one2)
                NumAndImageView3(number: 2, boxToPutIn: $viewModel.two2)
                NumAndImageView3(number: 3, boxToPutIn: $viewModel.three2)
                NumAndImageView3(number: 4, boxToPutIn: $viewModel.four2)
                NumAndImageView3(number: 5, boxToPutIn: $viewModel.five2)
                
                ZStack {
                    Rectangle()
                        .propotionalFrame(width: .infinity, height: 0.13)
                        .foregroundColor(.white)
                    
                    ZStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(images.indices, id: \.self) { imageIndex in
                                    ZStack {
                                        Image(uiImage: images[imageIndex])
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .propotionalFrame(width: 0.25, height: 0.125)
                                            .cornerRadius(10)
                                            .draggable(Image(uiImage: images[imageIndex]))
                                    }
                                }
                            }
                        }
                        
                    }
                    .transition(.move(edge: .bottom))
                    .background { Color.white }
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct NumAndImageView3: View {
    let number: Int
    @Binding private var boxToPutIn: [Image]
    var body: some View {
            HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                Text("\(number)")
                    .font(.system(.title3, weight: .semibold))
                    .foregroundColor(.white)
                
                ZStack {
                    Rectangle()
                        .propotionalFrame(width: 0.25, height: 0.125)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .dropDestination(for: Image.self) { droppedImages, location in
                            boxToPutIn += droppedImages
                            return true
                        }
                    
                    ForEach(boxToPutIn.indices, id: \.self) { index in
                        boxToPutIn[index]
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.125)
                            .cornerRadius(10)
                    }
                    
                }
            }
    }
    init(number: Int, boxToPutIn: Binding<[Image]>) {
            self.number = number
            _boxToPutIn = boxToPutIn
        }
}

#Preview {
    let pickTitle = PickTitle()
    let choosePhotos = ChoosePhotos(title: pickTitle.$title)
    
    return OwnRankingView(title: pickTitle.$title, images: choosePhotos.$images)
}
