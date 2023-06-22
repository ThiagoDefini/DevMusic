//
//  FavoritesTableViewCell.swift
//  DevMusic
//
//  Created by Thiago Defini on 20/06/23.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        musicImage.layer.cornerRadius = 4
        
        
    }
    
}
