//
//  ProductCollectionView.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 2.08.2022.
//

import UIKit

final class ProductCollectionView: UIView {
    private let cellId = "productCell"
    private var offset = 0
    private var limit = 10
    private var productList: [Product] = []
    private var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension ProductCollectionView: HomeViewModel, UICollectionViewDelegate, UICollectionViewDataSource {
    private func commonInit() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: SpaceConstants.smallWPad,
            left: SpaceConstants.smallWPad,
            bottom: SpaceConstants.smallWPad,
            right: SpaceConstants.smallWPad
        )
        layout.itemSize = CGSize(width: (100.0.responsiveW - 60) / 2, height: 63.0.responsiveW)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.isScrollEnabled = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.reloadData()
        collectionView.edgesToSuperview()
        
        getProducts { [weak self] result in
            self?.productList = result
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - Data
extension ProductCollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ProductCell {
            if indexPath.row == productList.count - 1 {
                if productList.count < 60 {
                    self.offset += limit
                    getProducts(offset: offset, limit: limit) { [weak self] result in
                        guard let self = self else { return }
                        self.productList += result
                        self.collectionView.reloadData()
                    }
                }
            }
            
            let data = self.productList[indexPath.item]
            cell.setupCell(model: data)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}
