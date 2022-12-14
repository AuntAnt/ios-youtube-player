//
//  Model.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 23.08.2022.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
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
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        // Call the videosFethced method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                // Write response in console
                // dump(response)
            } catch {
            
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
