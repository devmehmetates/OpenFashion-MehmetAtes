//
//  HomeViewController.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 30.01.2023.
//

import UIKit
import TYImageSlider

protocol HomeViewProtocol: AnyObject {
    func setupScrollView()
}

final class HomeViewController: UIViewController {
    var presenter: HomePresenter!
    var scrollView: UIScrollView = UIScrollView()
    var contentStack: UIStackView = UIStackView()
    
    // Content
    private let imageSliderView: ImageSliderView = ImageSliderView()
    private let collectionView = ProductCollectionView()
    private let exploreMoreButton = UIButton()
    private let collectionDivider = UIView()
    private let collectionTitle = UILabel()
    private let collectionStack = UIStackView()
    private let lastDivider = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.notifyViewLoaded()
    }
}

// MARK: - HomeViewProtocol Stumbs
extension HomeViewController: HomeViewProtocol {
    func setupScrollView() {
        addScrollViewToSuperView()
        configureImageSliderView()
        configureArrivalDivider()
        configureCollectionView()
    }
    
    func addScrollViewToSuperView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)
        
        scrollView.edgesToSuperview()
        contentStack.widthToSuperview()
        contentStack.edgesToSuperview()
        contentStack.axis = .vertical
    }
}

// MARK: - ImageSlider
extension HomeViewController {
    private func configureImageSliderView() {
        let sliderView = UIView()
        let imageSliderPresenter = ImageSliderViewPresenter(
            imageUrls: [StaticDatas.examleImage1, StaticDatas.examleImage2, StaticDatas.examleImage3,
                        StaticDatas.examleImage4, StaticDatas.examleImage5, StaticDatas.examleImage6],
            loopingEnabled: true, view: imageSliderView)
        imageSliderView.presenter = imageSliderPresenter

        imageSliderView.translatesAutoresizingMaskIntoConstraints = false
        imageSliderView.isUserInteractionEnabled = true
        imageSliderView.clipsToBounds = true
        imageSliderView.layer.cornerRadius = 10
        imageSliderView.height(65.0.responsiveH)
        sliderView.addSubview(imageSliderView)
        imageSliderView.leadingToSuperview(offset: SpaceConstants.smallWPad)
        imageSliderView.trailingToSuperview(offset: SpaceConstants.smallWPad)
        imageSliderView.verticalToSuperview()
        contentStack.addArrangedSubview(sliderView)
    }
}

// MARK: New arrival divider
extension HomeViewController {
    private func configureArrivalDivider() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: AppConstants.fontName, size: 20)
        label.text = AppTexts.newArrivalText
        label.textAlignment = .center
        
        view.addSubview(label)
        label.centerXToSuperview()
        label.widthToSuperview()
        label.topToSuperview(offset: SpaceConstants.smallWPad)
        
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.drawDividerShape()
        view.addSubview(divider)
        
        divider.centerXToSuperview()
        divider.widthToSuperview()
        divider.topToBottom(of: label, offset: 5)
        divider.height(10)
        divider.bottomToSuperview()
        
        contentStack.addArrangedSubview(view)
    }
}

// MARK: CollectionView
extension HomeViewController {
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addArrangedSubview(collectionView)
        collectionView.height(140.0.responsiveW)
        collectionView.width(100.0.responsiveW)
    }
}
