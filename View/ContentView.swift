//
//  ContentView.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
        
        // Always Dark Mode
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
