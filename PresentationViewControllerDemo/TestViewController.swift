//
//  TestViewController.swift
//  CRM
//
//  Created by Ankush Macbook Pro on 13/02/19.
//  Copyright © 2019 Mahindra & Mahindra. All rights reserved.
//

import UIKit
import Foundation

class TestViewController:UIViewController, UIViewControllerTransitioningDelegate {
    
    var presentationController1: PresentationController?
    
    //MARK:- UIViewControllerTransitioning Delegate Methods
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        presentationController1 = PresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController1!
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //if self.responds(to: #selector(self.setTransitioningDelegate)) {
        
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
        //}
    }
    
    //MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presentationController1?.height = 100
        presentationController1?.presentationTransitionWillBegin()
    }
}
