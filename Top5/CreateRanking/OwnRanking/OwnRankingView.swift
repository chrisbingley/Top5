//
//  OwnRankingView.swift
//  Top5
//
//  Created by Christian Bingley on 1/12/24.
//

import SwiftUI

struct OwnRankingView: View {
    @StateObject private var viewModel = OwnRankingViewModel()
    
    @State private var rotationAngle: Double = 0
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    // ON CLICK OF BACK BUTTON CALL FUNCTION TO CLEAR IMAGES LIST
    
    @Binding var title: String
    @Binding var images: [UIImage]
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack {
                
                if viewModel.showDoneButton && viewModel.areAllNumAndImageViewsFilled {
                    HStack {
                        BackButtonView()
                            .offset(x: UIScreen.main.bounds.width * -0.2, y: UIScreen.main.bounds.height * 0.01)
                        
                        
                        Button {
                            withAnimation {
                                viewModel.showingBox = false
                                viewModel.showShareButton = true
                                viewModel.showDoneButton = false
                            }
                        } label: {
                            Text("Done")
                                .font(.system(.subheadline, weight: .bold))
                                .foregroundColor(.black)
                                .propotionalFrame(width: 0.2, height: 0.03)
                        }
                        .background {
                            Color.white
                        }
                        .cornerRadius(10)
                        .offset(x: UIScreen.main.bounds.width * 0.2, y: UIScreen.main.bounds.height * 0.01)
                    }
                } else {
                    if !viewModel.showDoneButton {
                        BackButtonView()
                    } else {
                        BackButtonView()
                            .offset(x: UIScreen.main.bounds.width * -0.34)
                    }
                }
                
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                VStack {
                    NumAndImageView3(number: 1, boxToPutIn: $viewModel.one2)
                    NumAndImageView3(number: 2, boxToPutIn: $viewModel.two2)
                    NumAndImageView3(number: 3, boxToPutIn: $viewModel.three2)
                    NumAndImageView3(number: 4, boxToPutIn: $viewModel.four2)
                    NumAndImageView3(number: 5, boxToPutIn: $viewModel.five2)
                }
                .offset(x: UIScreen.main.bounds.width * -0.03, y: UIScreen.main.bounds.height * 0.03)
                
                if viewModel.showShareButton {
                    Button {
                        viewModel.showModal = true
                    } label: {
                        Text("Share!")
                            .font(.system(.headline, weight: .semibold))
                    }
                    .propotionalFrame(width: 0.4, height: 0.05)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(30)
                    .offset(x: UIScreen.main.bounds.width * 0.02, y: UIScreen.main.bounds.height * 0.05)
                    .padding(.top)
                }
                
                if viewModel.showShareButton {
                    HStack {
                        Button {
                            viewModel.changeDaCount()
                        } label: {
                            Image("color-change")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .propotionalFrame(width: 0.05, height: 0.06)
                        }
                        .propotionalFrame(width: 0.8, height: 0.04)
                        
                        Button {
                            withAnimation {
                                viewModel.showingBox.toggle()
                            }
                        } label: {
                            Image("down")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .propotionalFrame(width: 0.05, height: 0.05)
                        }
                        .disabled(true)
                        .propotionalFrame(width: 0.8, height: 0.04)
                    }
                } else {
                    HStack {
                        Button {
                            viewModel.changeDaCount()
                        } label: {
                            Image("color-change")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .propotionalFrame(width: 0.05, height: 0.06)
                        }
                        .propotionalFrame(width: 0.8, height: 0.04)
                        
                        Button {
                            withAnimation {
                                viewModel.showingBox.toggle()
                                rotationAngle += 180
                            }
                        } label: {
                            Image("down")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .propotionalFrame(width: 0.05, height: 0.05)
                        }
                        .propotionalFrame(width: 0.8, height: 0.04)
                        .rotationEffect(.degrees(rotationAngle))
                    }
                }
                
                if viewModel.showingBox {
                
                ZStack {
                    Rectangle()
                        .propotionalFrame(width: .infinity, height: 0.13)
                        .foregroundColor(.white)
                    
                    ZStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                                ForEach(images.indices, id: \.self) { imageIndex in
                                    ZStack {
                                        Image(uiImage: images[imageIndex])
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .propotionalFrame(width: 0.25, height: 0.125)
                                            .cornerRadius(10)
                                            .draggable(Image(uiImage: images[imageIndex]))
                                        
                                        // where we will add on tap
                                            .onTapGesture {
                                                
                                            }
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
        .navigationBarBackButtonHidden(true)
        .blur(radius: viewModel.showModal ? 20 : 0)
        .overlay(
            
            viewModel.showModal ?
            VStack  {
                ModalView(showModal: $viewModel.showModal, showingSnap: $viewModel.showingSnap, showingInsta: $viewModel.showingInsta, showingTikTok: $viewModel.showingTikTok)
                
                Button {
                    let image = viewModel.imageToSave.asUIImage()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                } label: {
                    Text("Save")
                        .font(.system(.subheadline, weight: .bold))
                        .foregroundColor(.black)
                        .propotionalFrame(width: 0.2, height: 0.03)
                }
                .background {
                    Color.white
                }
                .cornerRadius(10)
            } : nil
            
        )
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
