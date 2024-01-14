//
//  UziRankingCustomViews.swift
//  Top5
//
//  Created by Christian Bingley on 8/4/23.
//

import Foundation
import SwiftUI

struct NumAndImageView2: View {
    let number: Int
    @Binding private var albums: [UziSong]
    @Binding private var theAlbums: [UziSong]
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
                        .dropDestination(for: UziSong.self) { droppedAlbums, location in
                            for album in droppedAlbums {
                                theAlbums.removeAll() { $0.id == album.id }
                            }
                            albums += droppedAlbums
                            return true
                        }
                    
                    ForEach(albums, id: \.self) { album in
                        UziSongView(song: album)
                    }
                    
                }
            }
    }
    init(number: Int, albums: Binding<[UziSong]>, theAlbums: Binding<[UziSong]>) {
            self.number = number
            _albums = albums
            _theAlbums = theAlbums
        }
}

struct RoundedBottomCorner: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(self.radius, rect.width/2, rect.height/2)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.closeSubpath()
        
        return path
    }
}

struct UziSongView: View {
    let song: UziSong
    var body: some View {
        ZStack {
            Image("uzi-album")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .propotionalFrame(width: 0.269, height: 0.22)
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                    .propotionalFrame(width: 0.269, height: 0.045)
                    .clipShape(RoundedBottomCorner(radius: 10))
                    .offset(y: UIScreen.main.bounds.height * 0.04)
                
                Text(song.songName)
                    .font(.system(.caption, weight: .bold))
                    .foregroundColor(.black)
                    .offset(y: UIScreen.main.bounds.height * 0.04)
            }
        }
        .propotionalFrame(width: 0.2, height: 0.125)
    }
}
