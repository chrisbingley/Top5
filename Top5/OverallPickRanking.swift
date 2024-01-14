//
//  OverallPickRanking.swift
//  Top5
//
//  Created by Christian Bingley on 1/5/24.
//

import SwiftUI

struct OverallPickRanking: View {
    
    @State private var showingOptions: Bool = false
    
    var body: some View {
        
            // title text for featured rankings
            TitleTexts(titleName: "featured today 👀")
            
            // featured list cell view (custom view)
            CellView(albumName: "the_ratty", numRankings: 1000000, title: "Brown University Best Dining Halls", nextView: SwiftRankingView())
            
            // trending title text (custom view)
            TitleTexts(titleName: "trending 🔥")
                .padding(.bottom, UIScreen.main.bounds.height * -0.2)
            
            // slider view for trending cells (custom view)
            SliderTabView()
            
            VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                
                Text("OR")
                    .font(.subheadline)
                
                // link to make your own
                NavigationLink {
                    PickTitle()
                } label: {
                    Text("make your own 👨‍🔬")
                        .font(.system(.title2, weight: .bold))
                        .foregroundColor(.white)
                        .background {
                            LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                                .propotionalFrame(width: 0.6, height: 0.06)
                                .cornerRadius(35)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                }
            }
            
            .swipeActions(allowsFullSwipe: true) {
                
            }
            .navigationBarBackButtonHidden(true)
            
            // nav bar at top of screen
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ImageView(imageName: "tf-1", propFrameWidth: 0.1, propFrameHeight: 0.06)
                }
                
                // profile link
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        // profile
                    } label: {
                        Image("practice-profile")
                            .propotionalFrame(width: 0.15, height: 0.03)
                            .clipShape(Circle())
                    }
                }
                
                // settings button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingOptions = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .propotionalFrame(width: 0.15, height: 0.05)
                            .foregroundColor(.white)
                    }
                    .confirmationDialog("", isPresented: $showingOptions, titleVisibility: .hidden) {
                        Button("Follow us on IG") {
                            
                        }
                        
                        Button("Sign Out", role: .destructive) {
                            
                        }
                    }
                }
            }
            .toolbarBackground(Color("Color"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .padding(.top, UIScreen.main.bounds.height * -0.02)
        }
    
}

#Preview {
    OverallPickRanking()
}
