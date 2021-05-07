//
//  FlickrImagesSearchVC.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

public class FlickrImagesSearchVC: UIViewController {

    var recentSearchs = Utils.getRecewntSearchArray()
    
    @IBOutlet weak var searchImagesSearchBar: UISearchBar!
    @IBOutlet weak var recentSearchTableView: UITableView!
    @IBOutlet weak var imagesListCollectionView: UICollectionView!
    @IBOutlet weak var recentSearchTableViewHeightConstraint: NSLayoutConstraint!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

       configViewSources()
    }
    
    private func configViewSources() {
        self.recentSearchTableView.delegate = self
        self.recentSearchTableView.dataSource = self
        self.recentSearchTableView.register(UINib(nibName: "RecentSearchCell", bundle: Bundle(for: RecentSearchCell.self)), forCellReuseIdentifier: RecentSearchCell.cellIdentifier)
        self.recentSearchTableView.alpha = 0
        self.recentSearchTableView.tableFooterView = UIView()
        
        self.imagesListCollectionView.delegate = self
        self.imagesListCollectionView.dataSource = self
        self.imagesListCollectionView.register(UINib(nibName: "FlickrImageCell", bundle: Bundle(for: FlickrImageCell.self)), forCellWithReuseIdentifier: FlickrImageCell.cellIdentifier)
        
        self.searchImagesSearchBar.delegate = self
    }

}
