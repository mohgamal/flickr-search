//
//  FlickrImageCell.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

class FlickrImageCell: UICollectionViewCell {

    static let cellIdentifier = "flickrImageCell"
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    func configCell() {
        self.containerView.layer.cornerRadius = 5
    }

}
