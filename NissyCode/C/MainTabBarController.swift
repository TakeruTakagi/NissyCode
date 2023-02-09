//
//  ViewController.swift
//  NissyCode
//
//  Created by 髙木　武 on 2022/12/10.
//

import UIKit

//Viewのフェードイン・フェードアウトの実装

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().shadowImage = UIImage()
        self.delegate = self
        view.backgroundColor = UIColor.systemBackground
    }
    
    func animateToTab(_ toIndex: Int) {
        
        guard let tabViewControllers = self.viewControllers,
              let toView = tabViewControllers[toIndex].view,
              let selectedViewController = selectedViewController,
              let fromView = selectedViewController.view,
              let fromIndex = tabViewControllers.firstIndex(of: selectedViewController),
              toIndex != fromIndex
        else { return }
        fromView.superview?.backgroundColor = UIColor.white
        
        guard let superview = fromView.superview else { return }
        superview.layer.shouldRasterize = true
        superview.addSubview(toView)
        
        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth / 4 : -screenWidth / 4)
        
        initializeToView(toView, isScrollRight: scrollRight, offSet: offset)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.curveEaseOut, .allowAnimatedContent], animations: {
            
            fromView.alpha = 0
            fromView.center.x = fromView.center.x - offset
        }, completion: { _ in
            
            toView.center.x = toView.center.x + offset
            UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.curveEaseIn, .allowAnimatedContent], animations: {
                
                toView.alpha = 1
                toView.center.x = toView.center.x - offset
            }, completion: { _ in
                
                fromView.removeFromSuperview()
                self.selectedIndex = toIndex
            })
        })
    }
    
    func initializeToView(_ toView: UIView, isScrollRight: Bool, offSet: CGFloat) {
        toView.alpha = 0
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let tabViewControllers = tabBarController.viewControllers!
        guard let toIndex = tabViewControllers.firstIndex(of: viewController) else {
            return false
        }
        
        animateToTab(toIndex)
        
        return true
    }
}

