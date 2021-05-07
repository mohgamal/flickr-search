//
//  FlickrImageCell.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import FlickrSearchDomain
import UIKit

class FlickrImageCell: UICollectionViewCell {

    static let cellIdentifier = "flickrImageCell"

    @IBOutlet weak var flickrImage: UIImageView!
    @IBOutlet weak var flickrTitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(with flickrImageEntity: FlickrImagesEntity.Photo?) {

        guard let flickrImageEntity = flickrImageEntity else { return }

        flickrImage.layer.cornerRadius = 5
        flickrTitleLabel.layer.cornerRadius = 5
        flickrTitleLabel.numberOfLines = 0
        flickrTitleLabel.text = flickrImageEntity.title
        flickrImage.downloaded(from: flickrImageEntity.id ?? "")
    }
}
