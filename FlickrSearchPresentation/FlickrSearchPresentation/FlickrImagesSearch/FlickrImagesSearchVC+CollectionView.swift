//
//  FlickrImagesSearchVC+CollectionView.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

extension FlickrImagesSearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.flickrImagesSearchVM.flickrSearchResult.photos?.photo?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrImageCell.cellIdentifier, for: indexPath) as! FlickrImageCell
        cell.configCell(with: self.flickrImagesSearchVM.flickrSearchResult.photos?.photo?[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
           let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
           let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
           return CGSize(width: size, height: size)
       }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (self.flickrImagesSearchVM.flickrSearchResult.photos?.photo?.count ?? 0) - 4 && !self.flickrImagesSearchVM.isLoading
            && self.flickrImagesSearchVM.page < (self.flickrImagesSearchVM.flickrSearchResult.photos?.pages ?? 0) {
            self.flickrImagesSearchVM.isLoading = true
            self.flickrImagesSearchVM.page += 1
            self.flickrImagesSearchVM.getFlickrSearchResults(with: searchImagesSearchBar.text ?? "", page: self.flickrImagesSearchVM.page)
        }
    }
    
}
