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
        self.recentSearchs = Utils.getRecewntSearchArray()
        if self.recentSearchs.count > 0 {
            
            if self.recentSearchs.count <= 5 {
                self.recentSearchTableViewHeightConstraint.constant = CGFloat(50 * self.recentSearchs.count)
            }
            
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.recentSearchTableView.alpha = 1.0
            })
            
            self.recentSearchTableView.isHidden = false
            self.recentSearchTableView.reloadData()
        }
        
        return true
    }
}
