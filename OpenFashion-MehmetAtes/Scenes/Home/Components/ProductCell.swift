//
//  ProductCell.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 2.08.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    let imageContainer: UIImageView = UIImageView()
    let descriptionLabel: UILabel = UILabel()
    let prizeLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension ProductCell {
    
    private func configureImage(_ url: String) {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.contentMode = .scaleAspectFill
        imageContainer.clipsToBounds = true
        
        addSubview(imageContainer)
        imageContainer.edgesToSuperview(excluding: .bottom)
        imageContainer.bottom(to: self, offset: -60)
        imageContainer.kf.setImage(with: URL(string: url)!)
    }
    
    private func configureTitle(_ title: String) {
        descriptionLabel.text = title
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor(named: ColorNames.bodyColor)
        descriptionLabel.font = UIFont(name: AppConstants.fontName, size: 12)
        descriptionLabel.textAlignment = .center
        
        addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: imageContainer, offset: 10)
        descriptionLabel.widthToSuperview()
    }
    
    private func configurePrizeTitle(_ price: Int) {
        prizeLabel.text = "$\(price)"
        prizeLabel.textAlignment = .center
        prizeLabel.textColor = UIColor(named: ColorNames.secondarColor)
        prizeLabel.font = UIFont(name: AppConstants.fontName, size: 15)
        addSubview(prizeLabel)
        
        prizeLabel.topToBottom(of: descriptionLabel)
        prizeLabel.widthToSuperview()
        prizeLabel.bottomToSuperview()
    }
}

// MARK: Binding
extension ProductCell {
    
    func setupCell(model: Product) {
        configureImage(model.images?.first ?? StaticDatas.examleImage1)
        configureTitle(model.title ?? "")
        configurePrizeTitle(model.price ?? 0)
    }
}
