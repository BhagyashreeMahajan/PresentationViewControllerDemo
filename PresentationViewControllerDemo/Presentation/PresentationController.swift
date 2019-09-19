//
//  PresentationController.swift
//  CRM
//
//  Created by Ankush Macbook Pro on 11/02/19.
//  Copyright © 2019 Mahindra & Mahindra. All rights reserved.
//

import UIKit
import Foundation

class PresentationController: UIPresentationController {
    
    var dimmingView: UIButton!
    var height: Int!
    
    func getDimmingView() -> UIButton? {
        let button = UIButton(frame: (presentingViewController.view.bounds))
        button.backgroundColor = UIColor(white: 0, alpha: 0.7)
        button.addTarget(self, action: #selector(self.dimmingViewClicked(_:)), for: .touchUpInside)
        
        return button
    }
    
    override func presentationTransitionWillBegin() {
        let presentedView: UIView? = presentedViewController.view
        presentedView?.layer.shadowColor = UIColor.black.cgColor
        presentedView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        presentedView?.layer.shadowOpacity = 0.0
        dimmingView = getDimmingView()
        dimmingView.alpha = 0
        containerView?.addSubview(dimmingView)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { context in
            self.dimmingView.alpha = 1
            
        })
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { context in
            self.dimmingView.alpha = 0
            
        })
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let frame = CGRect(x: CGFloat(20), y: (containerView!.frame.size.height - CGFloat(height)) / 2, width: CGFloat(containerView!.frame.size.width - 40), height: CGFloat(height))
        return frame
    }
    
    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    @objc func dimmingViewClicked(_ sender: Any?) {
        if (self.presentedView != nil) {
            presentedViewController.dismiss(animated: true)
        }
    }
}
