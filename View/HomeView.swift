//
//  HomeView.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI

struct HomeView: View {
    // Storing Current Tab
    @State var selectedTab = "house.fill"
    
    // Volume
    @State var volume: CGFloat = 0.4
    var body: some View {
        HStack(spacing: 0) {
            
            let lightWhite = Color.white.opacity(0.7)
            // Side Tab Bar
            VStack {
                
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .padding(.top)
                
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
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(lightWhite)
                })
                .padding(.top, 30)
                .padding(.bottom, getSafeArea().bottom == 0 ? 15: 0)
            }
            .frame(width: 80)
            .background(Color.black.ignoresSafeArea())
            
            //Main Content
            ScrollView(showsIndicators: false, content: {
                
            })
            .background(Color("bg").ignoresSafeArea())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TabButton: View {
    
    @Binding var selectedTab: String
    var  image : String
    
    var body: some View {
        
        Button(action: {withAnimation{selectedTab = image}}, label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6))
                .frame(maxHeight: .infinity)
        })
    }
    
}

// Extending View to get Screen Size

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
    // Getting SafeArea
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
