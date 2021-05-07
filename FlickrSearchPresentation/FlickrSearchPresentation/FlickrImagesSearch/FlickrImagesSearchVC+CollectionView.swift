//
//  FlickrImagesSearchVC+CollectionView.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import UIKit

extension FlickrImagesSearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrImageCell.cellIdentifier, for: indexPath) as! FlickrImageCell
        return cell
    }
    
}
