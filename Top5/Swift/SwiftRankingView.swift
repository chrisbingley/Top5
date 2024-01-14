//
//  SwiftRankingView.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI

struct SwiftRankingView: View {
    
    @StateObject private var viewModel = SwiftRankingViewModel()
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack {
            
            if viewModel.daCount == 1 {
                viewModel.getLinearGradient()
                    .ignoresSafeArea()
            } else if viewModel.daCount == 2 {
                LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
            } else if viewModel.daCount == 3 {
                LinearGradient(colors: [.white, .blue], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
            } else {
                Color.clear
            }
            
                VStack {
                    VStack {
                            if viewModel.showDoneButton && viewModel.areAllNumAndImageViewsFilled {
                                HStack(spacing: UIScreen.main.bounds.width * 0.5) {
                                    Button {
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Back")
                                            .font(.system(.subheadline, weight: .bold))
                                            .foregroundColor(.black)
                                            .propotionalFrame(width: 0.2, height: 0.03)
                                    }
                                    .background {
                                        Color.white
                                    }
                                    .cornerRadius(10)
                                    

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
                                    
                                    Button {
                                        withAnimation {
                                            viewModel.showingBox = false
                                        }
                                        viewModel.showShareButton = true
                                        viewModel.showDoneButton = false
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
                                    
                                }
                            } else {
                                
                                HStack(spacing: UIScreen.main.bounds.width * 0.5) {
                                    
                                    Button {
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Text("Back")
                                            .font(.system(.subheadline, weight: .bold))
                                            .foregroundColor(.black)
                                            .propotionalFrame(width: 0.2, height: 0.03)
                                    }
                                    .background {
                                        Color.white
                                    }
                                    .cornerRadius(10)
                                    .offset(x: UIScreen.main.bounds.width * 0.015)
                                    
                                    if viewModel.showDoneButton && viewModel.areAllNumAndImageViewsFilled {
                                        Button {
                                            withAnimation {
                                                viewModel.showingBox = false
                                            }
                                            viewModel.showShareButton = true
                                            viewModel.showDoneButton = false
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
                                    }
                                }
                            }

                                Text("Brown University Best Dining Halls")
                                    .font(.system(.title2, weight: .semibold))
                                    .foregroundColor(.white)
                        
                        VStack {
                            NumAndImageView(number: 1, words: $viewModel.one, theAlbums: $viewModel.theAlbums)
                            NumAndImageView(number: 2, words: $viewModel.two, theAlbums: $viewModel.theAlbums)
                            NumAndImageView(number: 3, words: $viewModel.three, theAlbums: $viewModel.theAlbums)
                            NumAndImageView(number: 4, words: $viewModel.four, theAlbums: $viewModel.theAlbums)
                            NumAndImageView(number: 5, words: $viewModel.five, theAlbums: $viewModel.theAlbums)
                        }
                        .offset(x: UIScreen.main.bounds.width * -0.0125)
                    }
                    .offset(y: UIScreen.main.bounds.height * 0.05)
                    
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
                                }
                            } label: {
                                Image("down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .propotionalFrame(width: 0.05, height: 0.05)
                            }
                            .propotionalFrame(width: 0.8, height: 0.04)
                        }
                    }

                    if viewModel.showingBox {
                        ZStack {
                            Rectangle()
                                .propotionalFrame(width: .infinity, height: 0.15)
                                .foregroundColor(.white)
                                .offset(y: UIScreen.main.bounds.height * 0.13)
                            ZStack {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(viewModel.theAlbums, id: \.id) { album in
                                            Image(album.albumName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .propotionalFrame(width: 0.25, height: 0.125)
                                                .cornerRadius(10)
                                                .draggable(album)
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
            .background {
                    Image("swift-concert")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius: viewModel.showModal ? 20 : 0)
            .overlay(
                viewModel.showModal ? ModalView(showModal: $viewModel.showModal, showingSnap: $viewModel.showingSnap, showingInsta: $viewModel.showingInsta, showingTikTok: $viewModel.showingTikTok) : nil
            
            )
    }
    
}

struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var showingSnap: Bool
    @Binding var showingInsta: Bool
    @Binding var showingTikTok: Bool
    var imageToShare: Image {
        return Image("tf-1")
    }
    var body: some View {
        
        VStack {
             HStack(spacing: UIScreen.main.bounds.width * 0.05) {
                 SocialMediaView(socialMedia: "snap", showingSnap: $showingSnap, showingInsta: $showingInsta, showingTikTok: $showingTikTok, isSelected: $showingSnap)
                 SocialMediaView(socialMedia: "insta", showingSnap: $showingSnap, showingInsta: $showingInsta, showingTikTok: $showingTikTok, isSelected: $showingInsta)
                 SocialMediaView(socialMedia: "tiktok", showingSnap: $showingSnap, showingInsta: $showingInsta, showingTikTok: $showingTikTok, isSelected: $showingTikTok)
                 }
            
            if showingSnap {
                ShareRanking(topText: "Share ranking on Snapchat", middleText: "Share to either your main or private story!", imageName: "snap-share")
            } else if showingInsta {
                ShareRanking(topText: "Share ranking on IG story", middleText: "Share to either your main or close friends story!", imageName: "insta-share")
            } else {
                ShareRanking(topText: "Share ranking on TikTok", middleText: "Don't forget to screen record while ranking to show your followers!", imageName: "tiktok-share")
            }
            
            Button {
                showModal = false
            } label: {
                Text("Dismiss")
                    .foregroundColor(.white)
            }
        }
    }
}

struct SocialMediaView: View {
    let socialMedia: String
    @Binding var showingSnap: Bool
    @Binding var showingInsta: Bool
    @Binding var showingTikTok: Bool
    
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            Color.white.opacity(isSelected ? 1.0 : 0.3)
            
            if socialMedia == "snap" {
                Button {
                    showingSnap = true
                    showingInsta = false
                    showingTikTok = false
                } label: {
                    Image(socialMedia)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .propotionalFrame(width: 0.3, height: 0.12)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.008)
                }
            } else if socialMedia == "insta" {
                Button {
                    showingSnap = false
                    showingInsta = true
                    showingTikTok = false
                } label: {
                    Image(socialMedia)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .propotionalFrame(width: 0.3, height: 0.07)
                }
            } else {
                Button {
                    showingSnap = false
                    showingInsta = false
                    showingTikTok = true
                } label: {
                    Image(socialMedia)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .propotionalFrame(width: 0.3, height: 0.1)
                        .padding(.trailing, UIScreen.main.bounds.width * -0.028)
                }
            }
        }
        .propotionalFrame(width: 0.25, height: 0.06)
        .cornerRadius(30)
        .padding(.bottom, UIScreen.main.bounds.height * 0.02)
    }
}

struct ShareRanking: View {
    let topText: String
    let middleText: String
    let imageName: String
    var imageToShare: Image {
        return Image("tf-1")
    }
    var body: some View {
        VStack {
            Text(topText)
                .font(.system(.title2, weight: .bold))
            Text(middleText)
                .font(.system(.caption, weight: .light))
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .propotionalFrame(width: 0.7, height: 0.35)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct SwiftRankingView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftRankingView()
    }
}
