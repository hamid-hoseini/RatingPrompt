//
//  ViewController.swift
//  RatingPrompt
//
//  Created by Hamid Hoseini on 9/28/20.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Rate Now", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        let alert = UIAlertController(title: "Feedback", message: "Are you enjoying the app?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, I love it!", style: .default, handler: {[weak self] _ in
            guard let scene = self?.view.window?.windowScene else {
                print("No Scene")
                return
            }
            SKStoreReviewController.requestReview(in: scene)
        }))
        alert.addAction(UIAlertAction(title: "No, This sucks!", style: .default, handler: {_ in
            // collect feedback:
            // 1- prompt user to email you
            // 2- open safari to your contact page
        }))
        
        present(alert, animated: true, completion: nil)
    }

}

