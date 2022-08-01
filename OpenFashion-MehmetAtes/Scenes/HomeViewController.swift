//
//  HomeViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit
import TYImageSlider
import TinyConstraints

class HomeViewController: UIViewController {
    
    // BASE
    private let scrollView: UIScrollView = UIScrollView()
    private let contentView: UIView = UIView()
    
    // Content
    private let imageSliderView: ImageSliderView = ImageSliderView()
    private let arrivalTitle = UILabel()
    private let arrivalDivider = UIView()
    
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
}
