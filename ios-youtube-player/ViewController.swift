//
//  ViewController.swift
//  ios-youtube-player
//
//  Created by Anton Kuzmin on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideo()
    }


}

