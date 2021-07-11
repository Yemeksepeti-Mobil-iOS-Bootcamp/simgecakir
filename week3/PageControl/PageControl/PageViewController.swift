//
//  ViewController.swift
//  PageControl
//
//  Created by Simge on 9.07.2021.
//

import UIKit

class PageViewController: UIViewController {

    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .clear
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
    
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageControl.frame = CGRect(x: view.center.x - view.frame.width / 4, y: view.frame.maxY - 200, width: view.frame.width / 2 , height: 50)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        
        configureScrollView()
    }
    
    private func configureScrollView(){
        
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        
        let colors: [UIColor] = [ .red, .green, .blue]
        for i in 0 ..< 3{
            
            let vc = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            
            vc.backgroundColor = colors[i]
            self.scrollView.addSubview(vc)
        }
    }
    
    @objc func pageControlDidChange(_ sender: UIPageControl){
        
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
}
//
//extension PageViewController: UIScrollViewDelegate {
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        let pageIndex = scrollView.contentOffset.x / scrollView.frame.width
//           pageControl.currentPage = Int(pageIndex)
//    }
//}
