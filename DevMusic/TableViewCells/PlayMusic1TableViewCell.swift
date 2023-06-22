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
    var fav: Bool?
    var music: Music?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        musicImage.image = UIImage(named: music?.id ?? "" )
        nameLabel.text = music?.title
        bandLabel.text = music?.artist
        guard let fav else { return }
        favoriteButton.setImage(UIImage(systemName: fav ? "heart.fill" : "heart"), for: .normal)
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let fav else { return }
        
        MusicService.singleton.toggleFavorite(music: music!, isFavorite: fav)
        self.fav?.toggle()
        favoriteButton.setImage(UIImage(systemName: fav ? "heart.fill" : "heart"), for: .normal)
        print(fav)
    }
    
}
