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
    private let collectionView = ProductCollectionView()
    private let exploreMoreButton = UIButton()
    private let collectionDivider = UIView()
    private let collectionTitle = UILabel()
    private let collectionStack = UIStackView()
    private let lastDivider = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
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
        configureExploreMoreButton()
        configureCollectionDivider()
        configureCollectionTitle()
        configureCollectionStack()
        configureLastDivider()
    }
    
    // MARK: ScrollView
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.edgesToSuperview()
        contentView.widthToSuperview()
        contentView.edgesToSuperview()
    }
    
    // MARK: ImageSlider
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
        imageSliderView.height(65.0.responsiveH)
    }
    
    private func configureExploreCollectionButton() {
        let exploreCollectionButton = UIButton()
        exploreCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        
        exploreCollectionButton.setTitle(AppTexts.exploreCollectionText, for: .normal)
        exploreCollectionButton.titleLabel?.font = UIFont(name: AppConstants.fontName, size: 20)
        exploreCollectionButton.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        exploreCollectionButton.layer.cornerRadius = 15
        contentView.addSubview(exploreCollectionButton)
        
        exploreCollectionButton.topToBottom(of: imageSliderView, offset: -80)
        exploreCollectionButton.leading(to: imageSliderView, offset: 60)
        exploreCollectionButton.trailing(to: imageSliderView, offset: -60)
        
        exploreCollectionButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    // TODO: Configure this button
    @objc
    func buttonAction() {
        let viewac = UIAlertController(title: "Okay", message: "Deneme", preferredStyle: .alert)
        viewac.addAction(UIAlertAction(title: "OK", style: .destructive))
        
        present(viewac, animated: true)
    }
    
    // MARK: New arrival divider
    private func configureArrivalDivider() {
        arrivalTitle.translatesAutoresizingMaskIntoConstraints = false
        arrivalDivider.translatesAutoresizingMaskIntoConstraints = false
        arrivalTitle.font = UIFont(name: AppConstants.fontName, size: 20)
        arrivalTitle.text = AppTexts.newArrivalText
        arrivalTitle.textAlignment = .center
        
        contentView.addSubview(arrivalTitle)
        
        arrivalTitle.centerXToSuperview()
        arrivalTitle.widthToSuperview()
        arrivalTitle.topToBottom(of: imageSliderView, offset: SpaceConstants.mediumHPad)
    
        arrivalDivider.drawDividerShape()
        
        contentView.addSubview(arrivalDivider)
        
        arrivalDivider.centerXToSuperview()
        arrivalDivider.widthToSuperview()
        arrivalDivider.topToBottom(of: arrivalTitle, offset: 5)
    }

    // MARK: CollectionView
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        collectionView.height(140.0.responsiveW)
        collectionView.widthToSuperview()
        collectionView.centerXToSuperview()
        collectionView.topToBottom(of: arrivalDivider, offset: SpaceConstants.mediumHPad)
    }
    
    // MARK: - ExploreMoreButton
    private func configureExploreMoreButton() {
        exploreMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        exploreMoreButton.setTitle(AppTexts.exploremoreText, for: .normal)
        exploreMoreButton.titleLabel?.font = UIFont(name: AppConstants.fontName, size: 16)
        exploreMoreButton.setTitleColor(UIColor(named: ColorNames.labelColor), for: .normal)
        exploreMoreButton.setImage(UIImage(named: IconNames.forwardArrowIcon), for: .normal)
        exploreMoreButton.semanticContentAttribute = .forceRightToLeft
        contentView.addSubview(exploreMoreButton)
        
        exploreMoreButton.topToBottom(of: collectionView, offset: SpaceConstants.smallWPad)
        exploreMoreButton.widthToSuperview()
        exploreMoreButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    // MARK: - CollectionDivider
    private func configureCollectionDivider() {
        collectionDivider.translatesAutoresizingMaskIntoConstraints = false
        
        collectionDivider.drawDividerShape()
        
        contentView.addSubview(collectionDivider)
        
        collectionDivider.centerXToSuperview()
        collectionDivider.widthToSuperview()
        collectionDivider.topToBottom(of: exploreMoreButton, offset: SpaceConstants.smallWPad)
    }
    
    // MARK: - CollectionTitle
    private func configureCollectionTitle() {
        collectionTitle.translatesAutoresizingMaskIntoConstraints = false
        collectionTitle.text = AppTexts.collectionText
        collectionTitle.font = UIFont(name: AppConstants.fontName, size: 20)
        
        contentView.addSubview(collectionTitle)
        
        collectionTitle.centerXToSuperview()
        collectionTitle.topToBottom(of: collectionDivider, offset: SpaceConstants.smallWPad)
    }
    
    // MARK: - Collection Stack
    private func configureCollectionStack() {
        collectionStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionStack)
        
        collectionStack.distribution = .fillEqually
        collectionStack.axis = .vertical
        collectionStack.spacing = 10
        
        configureCasualStackImage()
        configureNaturalStackImage()
        configureFitStackImage()
        
        collectionStack.topToBottom(of: collectionTitle, offset: SpaceConstants.smallWPad)
        collectionStack.widthToSuperview()
        
        collectionStack.height(100.0.responsiveH)
    }
    
    private func configureCasualStackImage() {
        let casualImage = UIImageView()
        casualImage.kf.setImage(with: URL(string: StaticDatas.exampleImage7)!)
        collectionStack.addArrangedSubview(casualImage)
        
        let casualTitle = UILabel()
        casualTitle.text = AppTexts.casualText
        casualTitle.font = UIFont(name: AppConstants.fontName, size: 30)
        casualTitle.textColor = .white
        casualTitle.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        casualTitle.layer.masksToBounds = true
        casualTitle.layer.cornerRadius = 15
        
        contentView.addSubview(casualTitle)
        casualTitle.leadingToSuperview(offset: SpaceConstants.mediumWPad)
        casualTitle.trailingToSuperview(offset: SpaceConstants.mediumWPad)
        casualTitle.textAlignment = .center
        casualTitle.centerY(to: casualImage)
    }
    
    private func configureNaturalStackImage() {
        let naturalImage = UIImageView()
        naturalImage.kf.setImage(with: URL(string: StaticDatas.exampleImage8)!)
        collectionStack.addArrangedSubview(naturalImage)
        
        let naturalTitle = UILabel()
        naturalTitle.text = AppTexts.naturalText
        naturalTitle.font = UIFont(name: AppConstants.fontName, size: 30)
        naturalTitle.textColor = .white
        naturalTitle.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        naturalTitle.layer.masksToBounds = true
        naturalTitle.layer.cornerRadius = 15
        
        contentView.addSubview(naturalTitle)
        naturalTitle.leadingToSuperview(offset: SpaceConstants.mediumWPad)
        naturalTitle.trailingToSuperview(offset: SpaceConstants.mediumWPad)
        naturalTitle.textAlignment = .center
        naturalTitle.centerY(to: naturalImage)
    }
    
    private func configureFitStackImage() {
        let fitImage = UIImageView()
        fitImage.kf.setImage(with: URL(string: StaticDatas.exampleImage9)!)
        collectionStack.addArrangedSubview(fitImage)
        
        let fitTitle = UILabel()
        fitTitle.text = AppTexts.fitText
        fitTitle.font = UIFont(name: AppConstants.fontName, size: 30)
        fitTitle.textColor = .white
        fitTitle.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        fitTitle.layer.masksToBounds = true
        fitTitle.layer.cornerRadius = 15
        
        contentView.addSubview(fitTitle)
        fitTitle.leadingToSuperview(offset: SpaceConstants.mediumWPad)
        fitTitle.trailingToSuperview(offset: SpaceConstants.mediumWPad)
        fitTitle.textAlignment = .center
        fitTitle.centerY(to: fitImage)
    }
    
    // MARK: - Last Divider
    private func configureLastDivider() {
        lastDivider.translatesAutoresizingMaskIntoConstraints = false
        lastDivider.drawDividerShape()
        
        contentView.addSubview(lastDivider)
        
        lastDivider.centerXToSuperview()
        lastDivider.widthToSuperview()
        lastDivider.topToBottom(of: collectionStack, offset: SpaceConstants.smallWPad)
        lastDivider.bottomToSuperview(offset: -10)
    }
}
