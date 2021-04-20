//
//  Song.swift
//  SpotifyDesign
//
//  Created by Egor Korchagin on 20.04.2021.
//

import SwiftUI


struct Song: Identifiable {
    
    var id = UUID().uuidString
    var album_name: String
    var album_author: String
    var album_cover: String
}

var recentlyPlayed = [
    
    Song(album_name: "Ye", album_author: "Kanye West", album_cover: "Ye"),
    Song(album_name: "Kanye", album_author: "Kaney West", album_cover: "kanye"),
    Song(album_name: "Man on the Moon", album_author: "Kid Cudi", album_cover: "kidcudi"),
    Song(album_name: "Jesus is king", album_author: "Kanye West", album_cover: "jesus")
]

var likedSongs = [
    Song(album_name: "Любимые песни", album_author: "Husky", album_cover: "h1"),
    Song(album_name: "Иуда", album_author: "Husky", album_cover: "h2"),
    Song(album_name: "Хошхоног", album_author: "Husky", album_cover: "h3")
]

var generes = ["Rap","Hip-Hop","Pop"]
