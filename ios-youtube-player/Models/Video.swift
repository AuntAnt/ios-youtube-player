//
//  Video.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 23.08.2022.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var descriptin = ""
    var thumbnail = ""
    var published: Date
    
    // Not specify string if key has the same name as property
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        // Parse description
        self.descriptin = try snippetContainer.decode(String.self, forKey: .description)
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse tumbnails
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let hishContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try hishContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse videoId
        let resourceIdContianer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContianer.decode(String.self, forKey: .videoId)
    }
}
