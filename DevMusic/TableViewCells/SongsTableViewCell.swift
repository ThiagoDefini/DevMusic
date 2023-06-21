//
//  SongsTableViewCell.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 20/06/23.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.coverImage.layer.cornerRadius = 4
    }

}
