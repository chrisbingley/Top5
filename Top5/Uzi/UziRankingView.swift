//
//  UziRankingView.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI

struct UziRankingView: View {
    
    @StateObject private var viewModel = SwiftRankingViewModel()
    @StateObject private var uziViewModel = UziRankingViewModel()
    
    @State private var rotationAngle: Double = 0

    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            ZStack {
                if uziViewModel.daCount == 1 {
                    viewModel.getLinearGradient()
                        .ignoresSafeArea()
                } else if uziViewModel.daCount == 2 {
                    LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                } else if uziViewModel.daCount == 3 {
                    LinearGradient(colors: [.white, .blue], startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                } else {
                    Color.clear
                }
                
                VStack {
                    VStack {
                        if uziViewModel.showDoneButton && uziViewModel.areAllNumAndImageViewsFilled {
                            HStack {
                                BackButtonView()
                                    .offset(x: UIScreen.main.bounds.width * -0.2, y: UIScreen.main.bounds.height * 0.01)
                                
                                
                                Button {
                                    withAnimation {
                                        uziViewModel.showingBox = false
                                        uziViewModel.showShareButton = true
                                        uziViewModel.showDoneButton = false
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
                            if !uziViewModel.showDoneButton {
                                BackButtonView()
                            } else {
                                BackButtonView()
                                    .offset(x: UIScreen.main.bounds.width * -0.34, y: UIScreen.main.bounds.height * 0.01)
                            }
                        }

                        Text("Best Songs from Pink Tape 🎟️")
                            .font(.system(.title, weight: .semibold))
                            .foregroundColor(.white)
                            
                        VStack {
                            HStack {
                                ZStack {
                                    NumAndImageView2(number: 1, albums: $uziViewModel.one2, theAlbums: $uziViewModel.theAlbums2)

                                    if !uziViewModel.one2.isEmpty {
                                        Button {
                                            uziViewModel.theAlbums2.append(uziViewModel.one2.first!)
                                            uziViewModel.one2.removeFirst()
                                        } label: {
                                            Image("X")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .propotionalFrame(width: 0.05, height: 0.05)
                                        }
                                        .offset(x: UIScreen.main.bounds.width
                                                * 0.15, y: UIScreen.main.bounds.width
                                                * -0.125)
                                    }
                                }
                            }
                            
                            ZStack {
                                NumAndImageView2(number: 2, albums: $uziViewModel.two2, theAlbums: $uziViewModel.theAlbums2)
                                
                                if !uziViewModel.two2.isEmpty {
                                    Button {
                                        uziViewModel.theAlbums2.append(uziViewModel.two2.first!)
                                        uziViewModel.two2.removeFirst()
                                    } label: {
                                        Image("X")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .propotionalFrame(width: 0.05, height: 0.05)
                                    }
                                    .offset(x: UIScreen.main.bounds.width
                                            * 0.15, y: UIScreen.main.bounds.width
                                            * -0.125)
                                }
                            }
                            
                            ZStack {
                                NumAndImageView2(number: 3, albums: $uziViewModel.three2, theAlbums: $uziViewModel.theAlbums2)
                                
                                if !uziViewModel.three2.isEmpty {
                                    Button {
                                        uziViewModel.theAlbums2.append(uziViewModel.three2.first!)
                                        uziViewModel.three2.removeFirst()
                                    } label: {
                                        Image("X")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .propotionalFrame(width: 0.05, height: 0.05)
                                    }
                                    .offset(x: UIScreen.main.bounds.width
                                            * 0.15, y: UIScreen.main.bounds.width
                                            * -0.125)
                                }
                            }
                            
                            ZStack {
                                NumAndImageView2(number: 4, albums: $uziViewModel.four2, theAlbums: $uziViewModel.theAlbums2)
                                
                                if !uziViewModel.four2.isEmpty {
                                    Button {
                                        uziViewModel.theAlbums2.append(uziViewModel.four2.first!)
                                        uziViewModel.four2.removeFirst()
                                    } label: {
                                        Image("X")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .propotionalFrame(width: 0.05, height: 0.05)
                                    }
                                    .offset(x: UIScreen.main.bounds.width
                                            * 0.15, y: UIScreen.main.bounds.width
                                            * -0.125)
                                }
                            }
                            
                            ZStack {
                                NumAndImageView2(number: 5, albums: $uziViewModel.five2, theAlbums: $uziViewModel.theAlbums2)
                                
                                if !uziViewModel.five2.isEmpty {
                                    Button {
                                        uziViewModel.theAlbums2.append(uziViewModel.five2.first!)
                                        uziViewModel.five2.removeFirst()
                                    } label: {
                                        Image("X")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .propotionalFrame(width: 0.05, height: 0.05)
                                    }
                                    .offset(x: UIScreen.main.bounds.width
                                            * 0.15, y: UIScreen.main.bounds.width
                                            * -0.125)
                                }
                            }
                        }
                        .offset(x: UIScreen.main.bounds.width * -0.0125)
                    }
                    .offset(y: UIScreen.main.bounds.height * 0.04)
                    
                    if uziViewModel.showShareButton {
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
                    
                    if uziViewModel.showShareButton {
                        HStack {
                            Button {
                                changeDaCount()
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
                                changeDaCount()
                            } label: {
                                Image("color-change")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .propotionalFrame(width: 0.05, height: 0.06)
                            }
                            .propotionalFrame(width: 0.8, height: 0.04)
                            
                            Button {
                                withAnimation {
                                    uziViewModel.showingBox.toggle()
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
                        .offset(y: UIScreen.main.bounds.height * -0.015)
                    }

                    if uziViewModel.showingBox {
                        ZStack {
                            Rectangle()
                                .propotionalFrame(width: .infinity, height: 0.13)
                                .foregroundColor(.white)
                            
                            ZStack {
                                ScrollView(.horizontal) {
                                    HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                                        ForEach(uziViewModel.theAlbums2, id: \.self) { song in
                                            ZStack {
                                                Image("uzi-album")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .propotionalFrame(width: 0.25, height: 0.125)
                                                    .cornerRadius(10)
                                                
                                                ZStack {
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .propotionalFrame(width: 0.25, height: 0.04)
                                                        .offset(y: UIScreen.main.bounds.height * 0.04)
                                                    
                                                    Text(song.songName)
                                                        .font(.system(.caption, weight: .bold))
                                                        .foregroundColor(.black)
                                                        .propotionalFrame(width: 0.25, height: 0.125)
                                                        .offset(y: UIScreen.main.bounds.height * 0.04)
                                                        .lineLimit(2)
                                                        .multilineTextAlignment(.center)
                                                    
                                                }
                                            }
                                            .draggable(song)
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
                Image("uzi-concert")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius: uziViewModel.showModal ? 20 : 0)
            .overlay(
                uziViewModel.showModal ?
                VStack  {
                    ModalView(showModal: $uziViewModel.showModal, showingSnap: $uziViewModel.showingSnap, showingInsta: $uziViewModel.showingInsta, showingTikTok: $uziViewModel.showingTikTok)
                    
                    Button {
                        //let image = uziViewModel.imageToSave.asUIImage()
                        //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
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
    func changeDaCount() {
        if uziViewModel.daCount > 3 {
            uziViewModel.daCount = 1
        } else {
            uziViewModel.daCount += 1
        }
    }
}

struct UziRankingView_Previews: PreviewProvider {
    static var previews: some View {
        UziRankingView()
    }
}
