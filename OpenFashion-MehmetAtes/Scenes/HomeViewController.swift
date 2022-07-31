//
//  HomeViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit
import TYImageSlider

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
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func configureExploreCollectionButton() {
        let exploreCollectionButton = UIButton()
        exploreCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        
        exploreCollectionButton.setTitle("Explore Collection", for: .normal)
        exploreCollectionButton.titleLabel?.font = UIFont(name: AppConstants.fontName, size: 20)
        exploreCollectionButton.backgroundColor = UIColor(named: ColorNames.labelColor)?.withAlphaComponent(0.85)
        exploreCollectionButton.layer.cornerRadius = 15
        contentView.addSubview(exploreCollectionButton)
        
        exploreCollectionButton.bottomAnchor.constraint(equalTo: imageSliderView.bottomAnchor, constant: -40).isActive = true
        exploreCollectionButton.centerXAnchor.constraint(equalTo: imageSliderView.centerXAnchor).isActive = true
        exploreCollectionButton.leadingAnchor.constraint(equalTo: imageSliderView.leadingAnchor, constant: 60).isActive = true
        exploreCollectionButton.bottomAnchor.constraint(equalTo: imageSliderView.bottomAnchor, constant: 60).isActive = true
        
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

        imageSliderView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageSliderView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageSliderView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageSliderView.heightAnchor.constraint(equalToConstant: 550).isActive = true
    }
    
    private func configureArrivalDivider() {
        arrivalTitle.translatesAutoresizingMaskIntoConstraints = false
        arrivalTitle.font = UIFont(name: AppConstants.fontName, size: 20)
        arrivalTitle.text = AppTexts.newArrivalText
        arrivalTitle.textAlignment = .center
        
        contentView.addSubview(arrivalTitle)
        
        arrivalTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        arrivalTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        arrivalTitle.topAnchor.constraint(equalTo: imageSliderView.bottomAnchor, constant: 30).isActive = true
    
        arrivalDivider.drawDividerShape()
        contentView.addSubview(arrivalDivider)
        
        arrivalDivider.translatesAutoresizingMaskIntoConstraints = false
        arrivalDivider.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        arrivalDivider.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        arrivalDivider.topAnchor.constraint(equalTo: arrivalTitle.bottomAnchor, constant: 5).isActive = true
        arrivalDivider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
