//
//  PlayMusic1TableViewCell.swift
//  DevMusic
//
//  Created by Thiago Defini on 22/06/23.
//

import UIKit

class PlayMusic1TableViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var fav: Bool = false
    var music: Music?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        musicImage.image = UIImage(named: music?.id ?? "" )
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        MusicService.singleton.toggleFavorite(music: music!, isFavorite: !fav)
        print(fav)
    }
    

}
