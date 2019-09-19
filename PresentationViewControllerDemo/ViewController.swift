//
//  ViewController.swift
//  PresentationViewControllerDemo
//
//  Created by Ankush Macbook Pro on 13/02/19.
//  Copyright © 2019 Mahindra & Mahindra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
//        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapHereButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        self.present(viewController, animated: true, completion: nil)
    }
}

