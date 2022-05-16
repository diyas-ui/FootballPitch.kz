//
//  CarouselView.swift
//  FootballPitch.kz
//
//  Created by 123456 on 17.05.2022.
//

import UIKit

class CarouselView: UIView {
    
    public var images: [UIImage?]?

    private let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Constants.screenWidth, height: 200))
    private var pageControl = UIPageControl(frame: .zero)
    private var frame1: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Methods
extension CarouselView {
    func setupScroll() {
        guard let images = images else { return }

        scrollView.delegate = self
        scrollView.isPagingEnabled = true

        self.addSubview(scrollView)
        for index in 0..<images.count {

            frame1.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame1.size = self.scrollView.frame.size
            
            let subView = UIImageView(frame: frame1)
            subView.image = images[index] ?? UIImage()
            
            self.scrollView.addSubview(subView)
        }
        
        configurePageControl()

        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * CGFloat(images.count), height: self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    func configurePageControl() {
        guard let images = images else { return }
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.palette(.lightGrey)
        self.pageControl.currentPageIndicatorTintColor = UIColor.palette(.white)
        self.pageControl.backgroundColor = .clear
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.top.equalTo(170)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
    
    func reloadPage() {
        setupScroll()
    }
}

//MARK: - UIScrollViewDelegate
extension CarouselView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

//MARK: - ConfigUI
extension CarouselView: CodeDesignable {
    func setupViews() {
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
    }
}
