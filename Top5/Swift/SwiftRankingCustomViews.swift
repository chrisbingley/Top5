//
//  SwiftRankingCustomViews.swift
//  Top5
//
//  Created by Christian Bingley on 8/4/23.
//

import Foundation
import SwiftUI

struct NumAndImageView: View {
    let number: Int
    @Binding private var albums: [Album]
    @Binding private var theAlbums: [Album]
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
                    .dropDestination(for: Album.self) { droppedAlbums, location in
                        for album in droppedAlbums {
                            theAlbums.removeAll { $0 == album }
                        }
                        albums += droppedAlbums
                        return true
                    }
                
                ForEach(albums, id: \.self) { album in
                    AlbumsView(theAlbum: album)
                }
                
            }
        }
    }
    init(number: Int, words: Binding<[Album]>, theAlbums: Binding<[Album]>) {
            self.number = number
            _albums = words
            _theAlbums = theAlbums
    }
}

struct AlbumsView: View {
    let theAlbum: Album
    var body: some View {
        Image(theAlbum.albumName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.125)
            .cornerRadius(10)
    }
}
