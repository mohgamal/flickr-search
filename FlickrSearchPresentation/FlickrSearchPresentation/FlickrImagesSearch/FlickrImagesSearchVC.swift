//
//  FlickrImagesSearchVC.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import Combine
import UIKit

public class FlickrImagesSearchVC: UIViewController {

    public let flickrImagesSearchVM: FlickrImagesSearchVM
    private var cancellable: AnyCancellable?

    private var cancellables: Set<AnyCancellable> = []

    var appDI: AppDIInterface

    public var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    var recentSearchs = Utils.getRecewntSearchArray()

    @IBOutlet weak var searchImagesSearchBar: UISearchBar!
    @IBOutlet weak var recentSearchTableView: UITableView!
    @IBOutlet weak var imagesListCollectionView: UICollectionView!
    @IBOutlet weak var recentSearchTableViewHeightConstraint: NSLayoutConstraint!

    public init(coder: NSCoder,appDI: AppDIInterface, flickrImagesSearchVM: FlickrImagesSearchVM) {
        self.appDI = appDI
        self.flickrImagesSearchVM = flickrImagesSearchVM
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Flickr Images Search"
        
        configViewSources()
        bindViewModel()
    }

    private func bindViewModel() {
        flickrImagesSearchVM.objectWillChange.sink { [weak self] in
            guard let self = self else {
                return
            }
            
            self.spinner.stopAnimating()

            if self.flickrImagesSearchVM.error != nil {
                self.viewAlert(with: self.flickrImagesSearchVM.error)
            } else {
                self.flickrImagesSearchVM.isLoading = false
                self.imagesListCollectionView.reloadData()
            }

        }.store(in: &cancellables)
    }

    public func addSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func viewAlert(with error: Error?) {
        let alert = UIAlertController(title: "Error Occured", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func configViewSources() {
        recentSearchTableView.delegate = self
        recentSearchTableView.dataSource = self
        recentSearchTableView.register(UINib(nibName: "RecentSearchCell", bundle: Bundle(for: RecentSearchCell.self)), forCellReuseIdentifier: RecentSearchCell.cellIdentifier)
        recentSearchTableView.alpha = 0
        recentSearchTableView.tableFooterView = UIView()
        recentSearchTableView.alwaysBounceVertical = false

        imagesListCollectionView.delegate = self
        imagesListCollectionView.dataSource = self
        imagesListCollectionView.register(UINib(nibName: "FlickrImageCell", bundle: Bundle(for: FlickrImageCell.self)), forCellWithReuseIdentifier: FlickrImageCell.cellIdentifier)

        searchImagesSearchBar.delegate = self
    }
}
