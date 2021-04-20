//
//  SideBarView.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        // Side Tab Bar
        VStack {
            
            // Icon Spotify
            Image("spotify")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 45, height: 45)
                .padding(.top)
            
            // Tab Buttons
            VStack {
                
                TabButton(selectedTab: $selectedTab, image: "house.fill")
                
                TabButton(selectedTab: $selectedTab, image: "safari.fill")
                
                TabButton(selectedTab: $selectedTab, image: "mic.fill")
                
                TabButton(selectedTab: $selectedTab, image: "clock.fill")
            }
            .frame(height: getRect().height / 2.3)
            .padding(.top)
            
            Spacer(minLength: 50)
            
            Button(action: {
                // Checking and increasing volume
                volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
            }, label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            // Custom VolumeProgressView
            
            GeometryReader {proxy in
            
                //Extrasing progress bar height and based on that getting progress value
                let height = proxy.frame(in: .global).height
                let progress = height * volume
            
                ZStack(alignment: .bottom) {
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 4)
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 4, height: progress)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            }
            .padding(.vertical, 20)
            
            Button(action: {// Checking and decreasing volume
                    volume = volume - 0.1 > 0 ? volume - 0.1 : 0}, label: {
                Image(systemName: "speaker.wave.1.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            Button(action: {withAnimation(.easeIn){
                showSideBar.toggle()
            }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: showSideBar ? -180: 0))
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            })
            .padding(.top, 30)
            .padding(.bottom, getSafeArea().bottom == 0 ? 15: 0)
            .offset(x: showSideBar ? 0: 100)
        }
        .frame(width: 80)
        .background(Color.black.ignoresSafeArea())
        .offset(x: showSideBar ? 0: -100 )
        //.padding(.trailing, showSideBar ? 0: -100)
        .zIndex(1)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
