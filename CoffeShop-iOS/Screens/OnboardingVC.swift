//
//  OnboardingVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 05/06/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    // MARK: -  Properties
    private let backgroundShape = UIImageView( image: UIImage(named: AssetManager.sliderBackground))
    private let imagenSlider = CSImageSlider()
    private let pageControl = UIPageControl()
    private let registerButton = CSButtonPlain("Register")
    private let loginButton = CSButtonOutline("Log In")
    private let facebookButton = CSButtonOutline("Connect with Facebook", color: .systemBlue)
    private let titleOnboarding = CSTitleLabel(fontSize: 36, fontWeight: .regular, textAlignment: .center)
    
    private let imagesForSlider = [UIImage(named: AssetManager.cart),
                                   UIImage(named: AssetManager.store),
                                   UIImage(named: AssetManager.drinks)]
    
    private lazy var stackButtonsView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: -  Private Methods
    private func setup() {        
        view.backgroundColor =  CustomColors.backgroundColor        
        view.addSubview(backgroundShape)
        view.addSubview(imagenSlider)
        view.addSubview(titleOnboarding)
        view.addSubview(stackButtonsView)
        view.addSubview(facebookButton)
        view.addSubview(pageControl)
        
        //Image slider
        imagenSlider.configure(with: imagesForSlider)
        imagenSlider.delegate = self
        
        //PageControl
        pageControl.addTarget(self, action: #selector(changeImage(_:)), for: .valueChanged)
        pageControl.pageIndicatorTintColor = CustomColors.primaryColor.withAlphaComponent(0.2)
        pageControl.currentPageIndicatorTintColor = CustomColors.primaryColor
        pageControl.numberOfPages = imagesForSlider.count
        
        //Title
        titleOnboarding.text = "Get the best coffee\nin town!"
        titleOnboarding.numberOfLines = 2
        titleOnboarding.textColor = CustomColors.primaryColor
        //Buttons
        stackButtonsView.addArrangedSubview(registerButton)
        stackButtonsView.addArrangedSubview(loginButton)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        facebookButton.setIcon(name: AssetManager.facebookIcon)
    }
    
    @objc private func changeImage(_ sender: UIPageControl) {
        self.imagenSlider.changeImage(itemIndex: sender.currentPage)
    }
    
    @objc private func registerButtonTapped() {
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    private func setupLayout() {
        //Image slider
        backgroundShape.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 15, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 300)
        
        imagenSlider.anchor(top: backgroundShape.topAnchor, left: backgroundShape.leadingAnchor  , right: backgroundShape.trailingAnchor, bottom: backgroundShape.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        pageControl.anchor(top: imagenSlider.bottomAnchor, left: imagenSlider.leadingAnchor, right: imagenSlider.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Title
        titleOnboarding.anchor(top: imagenSlider.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 50, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 280, height: 80)
        titleOnboarding.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Buttons
        stackButtonsView.anchor(top: titleOnboarding.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 50, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 50)
        
        facebookButton.anchor(top: stackButtonsView.bottomAnchor, left: stackButtonsView.leadingAnchor, right: stackButtonsView.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 50)
        
    }
    
}

// MARK: -  ImagenSliderDelegate
extension OnboardingVC: ImagenSliderDelegate {
    func imagenSliderDidChangeImage(index currentImagenIndex: Int) {
        pageControl.currentPage = currentImagenIndex
    }
}
