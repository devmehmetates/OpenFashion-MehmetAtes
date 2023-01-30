//
//  SearchViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 4.08.2022.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell {
           // cell.backgroundColor = .systemBackground
            
            cell.setupCell(model: Product(id: 1, title: "Deneme", price: 100, description: "Deneme", category: nil, images: [
                StaticDatas.exampleImage7
            ]))
            return cell
        }
        return UICollectionViewCell()
    }
    
    private var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie Search"
        view.backgroundColor = .systemBackground
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        view.addSubview(productCollectionView)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        configureUI()
    }
    
    private var searchBar: UISearchController = {
        let searchBar = UISearchController()
        searchBar.searchBar.placeholder = "Enter the movie name"
        searchBar.searchBar.searchBarStyle = .minimal
        return searchBar
    }()
       
   private var productCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
       return collectionView
   }()
    
    // MARK: - HELPERS
    func configureUI() {
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        productCollectionView.edgesToSuperview()
    }
}

extension SearchViewController: UISearchResultsUpdating, HomeViewModel, SearchViewModel {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        print(query)
        getProducts(offset: 0, limit: 10) { result in
            self.products = result
            self.productCollectionView.reloadData()
        }
        
        getSearch(query)
    }
}
