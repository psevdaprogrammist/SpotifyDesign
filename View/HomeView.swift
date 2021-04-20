//
//  HomeView.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack(spacing: 0) {
            
            // Side Tab Bar
            VStack {
                
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                Spacer()
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
