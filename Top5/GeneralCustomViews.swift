//
//  GeneralCustomViews.swift
//  Top5
//
//  Created by Christian Bingley on 8/4/23.
//

import Foundation
import SwiftUI

// view for all images
struct ImageView: View {
    let imageName: String
    let propFrameWidth: CGFloat
    let propFrameHeight: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .propotionalFrame(width: propFrameWidth, height: propFrameHeight)
    }
}

// view for all linear gradients
struct LinearGradientView: View {
    let color1: Color
    let color2: Color
    var body: some View {
        LinearGradient(colors: [color1, color2], startPoint: .trailing, endPoint: .leading)
            .ignoresSafeArea()
    }
}

// view for (most) buttons
struct ButtonView<Content: View>: View {
    let nextView: Content
    let buttonText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .propotionalFrame(width: 0.6, height: 0.07)
                .opacity(0.2)
                .cornerRadius(30)
                
            NavigationLink {
                    nextView
            } label: {
                Text(buttonText)
                    .font(.system(.headline, weight: .bold))
                    .propotionalFrame(width: 0.59, height: 0.066)
                    .background(Color.white)
                    .cornerRadius(30)
                    .foregroundColor(.black)
            }
        }
    }
}

// view for insta username text field
struct CharacterLimitedTextField: View {
    @Binding var text: String
    let characterLimit: Int
    var body: some View {
        TextField("", text: $text)
            .onChange(of: text) { newValue in
                if newValue.count > characterLimit {
                    text = String(newValue.prefix(characterLimit))
                }
            }
    }
}

// view for circles in choose rank share view
struct CirclesView: View {
    @Binding var fillOrStroke: String
    @State var number: Int
    var body: some View {
        if (fillOrStroke == "fill") {
            ZStack {
                Circle()
                    .fill()
                    .frame(width: 18, height: 18)
                Text("\(number)")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
            }
            .padding(5)
        } else {
            ZStack {
                Circle()
                    .stroke()
                    .frame(width: 18, height: 18)
                Text("\(number)")
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .bold))
            }
            .padding(5)
        }
    }
}

/*
struct LittleCirclesView: View {
    let color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .propotionalFrame(width: 0.05, height: 0.01)
    }
}
 */

struct CellView<Content: View>: View {
    let albumName: String
    let numRankings: Int
    let title: String
    let nextView: Content
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(.gray)
                .opacity(0.15)
                .propotionalFrame(width: 0.85, height: 0.25)
            
            ImageView(imageName: albumName, propFrameWidth: 0.83, propFrameHeight: 0.24)
                .cornerRadius(35)
            
            ZStack {
                RoundedBottomCorner(radius: 30)
                    .foregroundColor(.white)
                    .propotionalFrame(width: 0.83, height: 0.1)
                    .offset(y: UIScreen.main.bounds.height * 0.07)
                
                VStack {
                    Text("\(numRankings) 🔥")
                        .font(.system(.caption, weight: .bold))
                        .foregroundColor(.white)
                        .propotionalFrame(width: 0.26, height: 0.01)
                        .lineLimit(1)
                        .offset(x: UIScreen.main.bounds.width * 0.31, y: UIScreen.main.bounds.height * 0.035)
                    
                    Text(title)
                        .font(.system(.title3, weight: .bold))
                        .lineLimit(1)
                        .offset(y: UIScreen.main.bounds.height * 0.044)
                    
                    NavigationLink {
                        nextView
                    } label: {
                        Text("RANK")
                            .font(.system(.headline, weight: .bold))
                            .foregroundColor(.white)
                            .background {
                                LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                                    .propotionalFrame(width: 0.4, height: 0.04)
                                    .cornerRadius(30)
                            }
                    }
                    .offset(y: UIScreen.main.bounds.height * 0.065)

                }
            }
        }
    }
}

struct TitleTexts: View {
    let titleName: String
    var body: some View {
        Text(titleName)
            .font(.system(.largeTitle, weight: .bold))
    }
}

struct SliderTabView: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
    }
    var body: some View {
        TabView {
            CellView(albumName: "the_ratty", numRankings: 1000000,
                     title: "Brown University Best Dining Halls", nextView: SwiftRankingView())
                .tabItem {
                    Text("Page 1")
                }
                .tag(0)
                
            CellView(albumName: "uzi-album", numRankings: 200000, title: "Best Songs from Pink Tape", nextView: UziRankingView())
                .tabItem {
                    Text("Page 2")
                }
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
    }
}

// custom proportional frame
extension View {
    func propotionalFrame(width: CGFloat, height: CGFloat, isSquared: Bool = false, alignment: Alignment = .center) -> some View {
        let finalWidth = UIScreen.main.bounds.width * width
        let finalHeight = isSquared ? finalWidth : UIScreen.main.bounds.height * height
        return frame(width: finalWidth, height: finalHeight)
    }
}

