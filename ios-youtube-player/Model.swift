//
//  Model.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 23.08.2022.
//

import Foundation

class Model {
    
    func getVideo() {
        
        // Create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            print("Error getting url")
            
            return
        }
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        // Force unwrap url cause it's checked in guard
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any error
            if error != nil && data == nil {
                return
            }
            
            // Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
