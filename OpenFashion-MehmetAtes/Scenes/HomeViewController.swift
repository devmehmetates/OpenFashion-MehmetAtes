//
//  HomeViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit
import TYImageSlider

class HomeViewController: UIViewController {
    private let scrollView: UIScrollView = UIScrollView()
    private let contentView: UIView = UIView()
    private let imageSliderView: ImageSliderView = ImageSliderView()

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
        let arrivalTitle = UILabel()
        arrivalTitle.translatesAutoresizingMaskIntoConstraints = false
        arrivalTitle.font = UIFont(name: AppConstants.fontName, size: 20)
        arrivalTitle.text = AppTexts.newArrivalText
        arrivalTitle.textAlignment = .center
        
        contentView.addSubview(arrivalTitle)
        
        arrivalTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        arrivalTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        arrivalTitle.topAnchor.constraint(equalTo: imageSliderView.bottomAnchor, constant: 10).isActive = true
        
        let arrivalDivider = UIView()
        arrivalDivider.drawDividerShape()
        
        contentView.addSubview(arrivalDivider)
        
        arrivalDivider.translatesAutoresizingMaskIntoConstraints = false
        arrivalDivider.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        arrivalDivider.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        arrivalDivider.topAnchor.constraint(equalTo: arrivalTitle.bottomAnchor, constant: 10).isActive = true
        arrivalDivider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
