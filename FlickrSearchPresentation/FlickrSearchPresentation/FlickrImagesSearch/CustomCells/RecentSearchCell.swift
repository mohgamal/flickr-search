//
//  RecentSearchCell.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

class RecentSearchCell: UITableViewCell {

    @IBOutlet weak var recentSearchTextLabel: UILabel!
    
    static let cellIdentifier = "recentSearchCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
