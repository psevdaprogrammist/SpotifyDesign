//
//  HomeView.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI

struct HomeView: View {
    
    // Search Text
    @State var searchText = ""

    var body: some View {
        HStack(spacing: 0) {
            
            SideTabView()
            
            //Main Content
            ScrollView(showsIndicators: false, content: {
                
                VStack(spacing: 15) {
                    
                    HStack(spacing: 15) {
                        
                        HStack(spacing: 15) {
                            
                            
                            
                            
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 25, height: 25)
                            TextField("Search...", text: $searchText)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(8)
                        
                        Button(action: {}, label: {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                        })
                    }
                    
                    Text("Recently Played")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                    
                    // Carousel list
                    TabView {
                        
                        ForEach(recentlyPlayed) {item in
                            
                            ZStack(alignment:.bottomLeading) {
                                Image(item.album_cover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(20)
                                    
                                
                                HStack {
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "play.fill")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding(20)
                                            .background(Color("logoColor"))
                                            .clipShape(Circle())
                                    })
                                }
                                .padding()
                            }
                            .padding(.horizontal)
                            
                        }
                    }
                    // Max Frame
                    .frame(height: 350)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, 20)
                }
                .padding()
                .frame(maxWidth: .infinity)
            })
            
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


