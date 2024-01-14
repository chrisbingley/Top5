//
//  ChooseRankShareView.swift
//  Top5
//
//  Created by Christian Bingley on 8/3/23.
//

import SwiftUI

struct ChooseRankShareView: View {
    
    // view model for choose rank share view
    @StateObject private var viewModel = ChooseRankShareViewModel()
    
    var body: some View {
            ZStack {
                
                // linear gradient background
                LinearGradientView(color1: .red, color2: .orange)
                
                VStack {
                    
                    // T5 logo
                    ImageView(imageName: "tf-1", propFrameWidth: 0.25, propFrameHeight: 0.25)
                    
                    VStack {
                        Text("literally 3 steps.")
                            .foregroundColor(.white)
                            .font(.system(.title2))
                            .bold()
                            .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                        
                        VStack {
                            // choose rank view texts
                            Text(viewModel.textName)
                                .font(.system(.title3, weight: .semibold))
                            
                            // middle image
                            Image(viewModel.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .propotionalFrame(width: 0.7, height: 0.3)
                            
                            HStack {
                                
                                // circles that contain the numbers (custom view)
                                CirclesView(fillOrStroke: $viewModel.theFillOrStroke1, number: 1)
                                CirclesView(fillOrStroke: $viewModel.theFillOrStroke2, number: 2)
                                CirclesView(fillOrStroke: $viewModel.theFillOrStroke3, number: 3)
                            }
                        }
                        // white background
                        .background {
                            Color.white
                                .propotionalFrame(width: 0.62, height: 0.41)
                                .cornerRadius(15)
                        }
                    }
                    // black background
                    .background {
                        Color.black.opacity(0.7)
                            .propotionalFrame(width: 0.65, height: 0.47)
                            .cornerRadius(15)
                    }
                    .propotionalFrame(width: 0.5, height: 0.45)
                    .padding()
                    
                    
                    // next button, cycles through the 3 pages then goes to next view
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .propotionalFrame(width: 0.59, height: 0.066)
                            .opacity(0.2)
                            .cornerRadius(30)
                        
                        VStack {
                            
                            NavigationLink(destination: OverallPickRanking(), isActive: $viewModel.isCycleComplete) {
                                Button {
                                    viewModel.update()
                                } label: {
                                    Text("Next")
                                        .font(.system(.headline, weight: .bold))
                                        .propotionalFrame(width: 0.58, height: 0.06)
                                        .background(Color.white)
                                        .cornerRadius(30)
                                        .foregroundColor(.black)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
    
struct ChooseRankShareView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRankShareView()
    }
}
