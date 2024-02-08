//
//  RankingCustomViews.swift
//  Top5
//
//  Created by Christian Bingley on 1/20/24.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
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
    }
}

struct SaveButtonView: View {
    @ObservedObject var viewModel: OwnRankingViewModel
        
    init(viewModel: OwnRankingViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
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
    }
}

struct DoneButtonView: View {
    @ObservedObject var viewModel: OwnRankingViewModel
        
    init(viewModel: OwnRankingViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
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

struct ShareButtonView: View {
    @ObservedObject var viewModel: OwnRankingViewModel
        
    init(viewModel: OwnRankingViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Button {
            viewModel.showModal = true
        } label: {
            Text("Share")
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
