//
//  FlickrImageCell.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

class FlickrImageCell: UICollectionViewCell {

    static let cellIdentifier = "flickrImageCell"
    
    @IBOutlet weak var flickrImage: UIImageView!
    @IBOutlet weak var flickrTitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell() {
        self.flickrImage.layer.cornerRadius = 5
        self.flickrTitleLabel.layer.cornerRadius = 5
        self.flickrTitleLabel.numberOfLines = 0
        
        self.flickrTitleLabel.text = "This is test title for the image This is test title for the image "
    }

}
