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
            Utils.logRecentSearch(with: searchtext)
        }
        
        self.recentSearchTableView.isHidden = true
        
        self.searchImagesSearchBar.resignFirstResponder()
    }
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.recentSearchTableView.isHidden = false
        self.recentSearchs = Utils.getRecewntSearchArray()
        self.recentSearchTableView.reloadData()
        return true
    }
}
