//
//  FlickrImagesSearch+SearchBar.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

extension FlickrImagesSearchVC: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchtext = searchBar.text else { return }
        if searchtext != "" {
            self.addSpinner()
            let currentLogSearch = Utils.getRecewntSearchArray()
            if !currentLogSearch.contains(where: { $0 == searchtext}) {
                Utils.logRecentSearch(with: searchtext)
            }
        }
        
        self.recentSearchTableView.alpha = 0.0
        self.imagesListCollectionView?.scrollToItem(at: IndexPath(row: 0, section: 0),
                                          at: .top,
                                    animated: true)
        self.flickrImagesSearchVM.getFlickrSearchResults(with: searchtext, page: 1)
        
        self.searchImagesSearchBar.resignFirstResponder()
    }
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.recentSearchs = Utils.getRecewntSearchArray()
        if self.recentSearchs.count > 0 {
            self.recentSearchTableViewHeightConstraint.constant = CGFloat(50 * self.recentSearchs.count)
            
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.recentSearchTableView.alpha = 1.0
                })
            
            self.recentSearchTableView.reloadData()
        }
        
        return true
    }
}
