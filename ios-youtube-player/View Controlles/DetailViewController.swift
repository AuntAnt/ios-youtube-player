//
//  DitailViewController.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 04.09.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLable: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = nil
        dateLable.text = nil
        textView.text = nil
        
        // Check if there is a video
        guard video != nil else {
            return
        }
        
        // Create the embed URL
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        
        // Load it into the webview
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        dateLable.text = df.string(from: video!.published)
        
        // Set the description
        textView.text = video!.descriptin
    }
}
