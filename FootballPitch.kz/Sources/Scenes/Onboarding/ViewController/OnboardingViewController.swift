//
//  OnboardingViewController.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 04.04.2022.
//

import UIKit


struct OnboardingStruct:Codable {
    var imageName, title, description:String
}

class OnboardingViewController: UIViewController {

    var arrOfStruct: [OnboardingStruct] = []
    let customCellIdentifier = "onboardingCellIdentifier"
    // MARK: - UI Elements
    
    fileprivate lazy var loginShadowView = StandardShadowView()
    fileprivate lazy var signUpShadowView = StandardShadowView()
    
    
    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.palette(.accent)
      button.addTarget(self, action: #selector(openLoginPage), for: .touchUpInside)
        let attributedText = NSMutableAttributedString()
                    attributedText.append(NSAttributedString(
                        string: "Login",
                        attributes: [NSAttributedString.Key.font : UIFont.regularPoppins(14),
                                     NSAttributedString.Key.foregroundColor : UIColor.palette(.white)]))
        button.setAttributedTitle(attributedText, for: .normal)
        return button
    }()
    
    fileprivate lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up by phone number", for: .normal)
        button.tintColor = UIColor.palette(.accent)
      button.addTarget(self, action: #selector(openRegistationPage), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, signUpShadowView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.palette(.lightGrey)
        pageControl.currentPageIndicatorTintColor = UIColor.palette(.accent)
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: view.frame.width, height: view.frame.height/1.5)
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(OnboardingViewCell.self, forCellWithReuseIdentifier: customCellIdentifier)
        return collectionView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        createArrOfStructs()
        setupViews()
    }
}

extension OnboardingViewController {
    func createArrOfStructs() {
        let firstPage = OnboardingStruct(
            imageName: "first_onboarding_image",
            title: "Book futsal fields",
            description: "Something")
        let secondPage = OnboardingStruct(
            imageName: "second_onboarding_image",
            title: "Organise your team",
            description: "Something")
        let thirdPage = OnboardingStruct(
            imageName: "third_onboarding_image",
            title: "Save your time",
            description: "Something")
        arrOfStruct = [firstPage, secondPage, thirdPage]
    }
}
            
// MARK: - Actions
extension OnboardingViewController {
    @objc
    private func openLoginPage() {
        let loginVC = LoginViewController(with: .login)
        loginVC.close = { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.openRegistationPage()
            }
        }
        present(loginVC, animated: true)
    }
    
    @objc
    private func openRegistationPage() {
        let loginVC = LoginViewController(with: .register)
        loginVC.close = { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.openLoginPage()
            }
        }
        present(loginVC, animated: true)
    }
}

// MARK: - UICollectionView
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfStruct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! OnboardingViewCell
        cell.setCell(object: arrOfStruct[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}

extension OnboardingViewController: CodeDesignable {
    
    func setupViews() {
        
        view.backgroundColor = UIColor.palette(.white)
        loginButton.layer.cornerRadius = 8
        signUpShadowView.cornerRadius = 8
        signUpShadowView.addSubview(signUpButton)
        [stackView, collectionView, pageControl].forEach {
            self.view.addSubview($0)
        }
        setupConstraints()
    }

    func setupConstraints() {
        
        stackView.snp.makeConstraints() {
            $0.height.equalTo(88)
            $0.left.right.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(58)
        }
        
        signUpButton.snp.makeConstraints() {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.width.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-20)
        }

    }
}
