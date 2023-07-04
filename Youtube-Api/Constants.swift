//
//  Constants.swift
//  Youtube-Api
//
//  Created by Fa Ainama Caldera S on 15/03/21.
//

import Foundation

// Struct untuk menampung URL JSON ( API )
struct Constants {
    static var API_KEY = "AIzaSyB6hwdB-eKSg7VM6Z69mFmElCPuDJF85aw"
    static var PLAYLIST_ID = "UUPe7UlHLVElw_Rcjupcij9Q"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
