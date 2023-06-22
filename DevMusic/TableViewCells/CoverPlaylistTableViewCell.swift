//
//  CoverPlaylistTableViewCell.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 22/06/23.
//

import UIKit

class CoverPlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
