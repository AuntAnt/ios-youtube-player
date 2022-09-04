//
//  CacheManager.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 04.09.2022.
//

import Foundation

class CacheManager {
    
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        return cache[url]
    }
}
