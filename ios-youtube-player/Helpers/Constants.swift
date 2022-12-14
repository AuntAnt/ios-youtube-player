//
//  Constants.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 23.08.2022.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PL5hq3tApc7D7RYIT-HL2Yw1d7i9-3bqgz"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    static var DATE_FORMAT = "EEEE, MMM d, yyyy"
}
