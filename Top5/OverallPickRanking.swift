//
//  OverallPickRanking.swift
//  Top5
//
//  Created by Christian Bingley on 1/5/24.
//

import SwiftUI

struct OverallPickRanking: View {
    
    @State private var showingOptions: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        // title text for featured rankings
        TitleTexts(titleName: "featured today 👀")
            .padding(.top, UIScreen.main.bounds.height * 0.025)
            .padding(.bottom, UIScreen.main.bounds.height * 0.008)
        
        // featured list cell view (custom view)
        if colorScheme == .dark {
            DarkModeCellView(imageName: "the_ratty", numRankings: 1000000, title: "Brown University Best Dining Halls", nextView: SwiftRankingView())
        } else {
            CellView(albumName: "the_ratty", numRankings: 1000000, title: "Brown University Best Dining Halls", nextView: SwiftRankingView())
        }
        
        // trending title text (custom view)
        TitleTexts(titleName: "trending 🔥")
            .padding(.bottom, UIScreen.main.bounds.height * -0.05)
        
        // slider view for trending cells (custom view)
        if colorScheme == .dark {
            DarkModeSliderTabView()
        } else {
            SliderTabView()
        }
        
        VStack(spacing: UIScreen.main.bounds.width * 0.01) {
        
            //VStack {
            Text("OR")
                .font(.subheadline)
                .padding(.top, UIScreen.main.bounds.height * 0.005)
                .padding(.bottom, UIScreen.main.bounds.height * 0.04)
            
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
                                colorScheme == .dark ? RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color.gray, lineWidth: 1) : RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
            }
            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.01)
            .padding(.bottom)
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
                Image("practice-profile")
                    .propotionalFrame(width: 0.15, height: 0.03)
                    .clipShape(Circle())
            }
            
            // settings button
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingOptions = true
                } label: {
                    colorScheme == .dark ?
                    Image(systemName: "gearshape.fill")
                        .propotionalFrame(width: 0.15, height: 0.05)
                        .foregroundColor(.black) :
                    Image(systemName: "gearshape.fill")
                        .propotionalFrame(width: 0.15, height: 0.05)
                        .foregroundColor(.white)
                }
                .confirmationDialog("", isPresented: $showingOptions, titleVisibility: .hidden) {
                    /*
                    Button("Follow us on IG") {
                        
                    }
                     */
                    Button("Follow us on IG") {
                        if let url = URL(string: "https://example.com") {
                            UIApplication.shared.open(url)
                        }
                    }
                    
                    Button("Sign Out", role: .destructive) {
                        presentationMode.wrappedValue.dismiss()
                        presentationMode.wrappedValue.dismiss()
                        presentationMode.wrappedValue.dismiss()
                        presentationMode.wrappedValue.dismiss()
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
    NavigationStack {
        OverallPickRanking()
    }
}
