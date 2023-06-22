//
//  PlayMusicViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class PlayMusicViewController: UIViewController {

    var music: Music?
    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var timePassLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var volumeBar: UIProgressView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Playing"
        
        musicImage.layer.cornerRadius = 12
        
        
        
        musicImage.image = UIImage(named: "\(music?.id)")
        nameLabel.text = music?.title
        bandLabel.text = music?.artist
        
    }
    
    
    
}
