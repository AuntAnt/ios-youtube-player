//
//  VideoTableViewCell.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 04.09.2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setCell(_ v: Video) {
        self.video = v
        
        // Ensure video is exists
        guard self.video != nil else {
            return
        }
        
        // Set the title label
        self.titleLabel.text = video?.title
        
        // Set the date label
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        guard url != nil else {
            print("Error of getting url")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                // Create the image object and set the image view
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }
}
