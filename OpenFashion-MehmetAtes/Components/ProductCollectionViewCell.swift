//
//  ProductCollectionViewCell.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 1.02.2023.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    private var stackViewContent: UIStackView = UIStackView()
    private var imageView: UIImageView = UIImageView()
    private var labelTitle: UILabel = UILabel()
    private var labelPrice: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Data Bind
extension ProductCollectionViewCell {
    func setupCell(with model: Product) {
        configureImageView(with: model.firstImage)
        configureTitle(with: model.title ?? "")
        configurePrice(with: model.price ?? 0)
    }
}

// MARK: Content StackView
extension ProductCollectionViewCell {
    private func prepareStackView() {
        addStackViewConstraints()
        configureStackView()
    }
    
    private func configureStackView() {
        stackViewContent.axis = .vertical
        stackViewContent.spacing = SpaceConstants.verySmallHPad
        stackViewContent.addArrangedSubview(imageView)
        stackViewContent.addArrangedSubview(labelTitle)
        stackViewContent.addArrangedSubview(labelPrice)
    }
    
    private func addStackViewConstraints() {
        addSubview(stackViewContent)
        stackViewContent.heightToSuperview()
        stackViewContent.edgesToSuperview()
    }
}

// MARK: - Image View
extension ProductCollectionViewCell {
    private func configureImageView(with url: URL?) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = SpaceConstants.smallWPad
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.tintColor = .gray
        imageView.kf.setImage(with: url, options: [
            .loadDiskFileSynchronously,
            .cacheMemoryOnly,
            .alsoPrefetchToMemory,
            .transition(.fade(0.25))
        ])
    }
}

// MARK: - Title Label
extension ProductCollectionViewCell {
    private func configureTitle(with title: String) {
        labelTitle.text = title
        labelTitle.numberOfLines = 0
        labelTitle.textColor = UIColor(named: ColorNames.bodyColor)
        labelTitle.font = UIFont(name: AppConstants.fontName, size: 12)
        labelTitle.textAlignment = .center
    }
}

// MARK: - Prize Label
extension ProductCollectionViewCell {
    private func configurePrice(with price: Int) {
        labelPrice.text = "$\(price)"
        labelPrice.textAlignment = .center
        labelPrice.textColor = UIColor(named: ColorNames.secondarColor)
        labelPrice.font = UIFont(name: AppConstants.fontName, size: 15)
    }
}
