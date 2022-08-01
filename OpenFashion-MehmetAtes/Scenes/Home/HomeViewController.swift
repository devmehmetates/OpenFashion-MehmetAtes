//
//  HomeViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit
import TYImageSlider
import TinyConstraints
import Kingfisher

class HomeViewController: UIViewController, HomeViewModel {
    
    // BASE
    private let scrollView: UIScrollView = UIScrollView()
    private let contentView: UIView = UIView()
    
    // Content
    private let imageSliderView: ImageSliderView = ImageSliderView()
    private let arrivalTitle = UILabel()
    private let arrivalDivider = UIView()
    private let collectionView = CustomCollectionView()
    
    // Data
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
        getProducts { [weak self] result in
            self?.productList = result
            self?.collectionView.setProductList(result)
        }
    }
}

// MARK: - Configure
extension HomeViewController {
    
    private func configureContent() {
        configureScrollView()
        configureImageSliderView()
        configureExploreCollectionButton()
        configureArrivalDivider()
        configureCollectionView()
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.edgesToSuperview()
        contentView.widthToSuperview()
        contentView.edgesToSuperview()
    }
    
    private func configureExploreCollectionButton() {
        let exploreCollectionButton = UIButton()
        exploreCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        
        exploreCollectionButton.setTitle("Explore Collection", for: .normal)
        exploreCollectionButton.titleLabel?.font = UIFont(name: AppConstants.fontName, size: 20)
        exploreCollectionButton.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        exploreCollectionButton.layer.cornerRadius = 15
        contentView.addSubview(exploreCollectionButton)
        
        exploreCollectionButton.topToBottom(of: imageSliderView, offset: -80)
        exploreCollectionButton.leading(to: imageSliderView, offset: 60)
        exploreCollectionButton.trailing(to: imageSliderView, offset: -60)
        
        exploreCollectionButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    func buttonAction() {
        let viewac = UIAlertController(title: "Okay", message: "Deneme", preferredStyle: .alert)
        viewac.addAction(UIAlertAction(title: "OK", style: .destructive))
        
        present(viewac, animated: true)
    }
    
    private func configureImageSliderView() {
        let imageSliderPresenter = ImageSliderViewPresenter(
            imageUrls: [StaticDatas.examleImage1, StaticDatas.examleImage2, StaticDatas.examleImage3,
                        StaticDatas.examleImage4, StaticDatas.examleImage5, StaticDatas.examleImage6],
            loopingEnabled: true, view: imageSliderView)
        imageSliderView.presenter = imageSliderPresenter

        imageSliderView.translatesAutoresizingMaskIntoConstraints = false
        imageSliderView.isUserInteractionEnabled = true
        contentView.addSubview(imageSliderView)
        
        imageSliderView.topToSuperview()
        imageSliderView.widthToSuperview()
        imageSliderView.centerXToSuperview()
        imageSliderView.height(550)
    }
    
    private func configureArrivalDivider() {
        arrivalTitle.translatesAutoresizingMaskIntoConstraints = false
        arrivalDivider.translatesAutoresizingMaskIntoConstraints = false
        arrivalTitle.font = UIFont(name: AppConstants.fontName, size: 20)
        arrivalTitle.text = AppTexts.newArrivalText
        arrivalTitle.textAlignment = .center
        
        contentView.addSubview(arrivalTitle)
        
        arrivalTitle.centerXToSuperview()
        arrivalTitle.widthToSuperview()
        arrivalTitle.topToBottom(of: imageSliderView, offset: 30)
    
        arrivalDivider.drawDividerShape()
        
        contentView.addSubview(arrivalDivider)
        
        arrivalDivider.centerXToSuperview()
        arrivalDivider.widthToSuperview()
        arrivalDivider.topToBottom(of: arrivalTitle, offset: 5)
    }
    
    private func configureCollectionView() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        collectionView.height(UIScreen.main.bounds.width * 1.4)
        collectionView.bottomToSuperview(offset: -10)
        collectionView.widthToSuperview()
        collectionView.centerXToSuperview()
        collectionView.topToBottom(of: arrivalDivider, offset: 30)
    }
}

class SubclassedCollectionViewCell: UICollectionViewCell {
    let imageContainer: UIImageView = UIImageView()
    let descriptionLabel: UILabel = UILabel()
    let prizeLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Product) {
        configureImage(model.images?.first ?? StaticDatas.examleImage1)
        configureTitle(model.title ?? "")
        configurePrizeTitle(model.price ?? 0)
    }
    
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

class CustomCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    var productList: [Product] = []
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProductList(_ productList: [Product]) {
        self.productList = productList
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productList.count
    }
    
    func commonInit() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: UIScreen.main.bounds.width * 0.63)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.isScrollEnabled = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(SubclassedCollectionViewCell.self, forCellWithReuseIdentifier: "subclassedcell")
        self.collectionView.backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.reloadData()
        collectionView.edgesToSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subclassedcell", for: indexPath) as? SubclassedCollectionViewCell {
            let data = self.productList[indexPath.item]
            cell.setupCell(model: data)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}
