//
//  ViewController.swift
//  RandomAnimation
//
//  Created by Максим Назаров on 19.09.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var animatedView: SpringView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var runAnimationButton: UIButton!
    
    private var animation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 10
        runAnimationButton.layer.cornerRadius = 10
        
        descriptionLabel.text = animation.description
    }

    @IBAction func runAnimationButtonTapped() {
        if runAnimationButton.titleLabel?.text == "Run" {
            animateView(animatedView, with: animation)
            
            animation = Animation.getAnimation()
            runAnimationButton.setTitle("Run \(animation.preset)", for: .normal)
        } else {
            animateView(animatedView, with: animation)
            
            descriptionLabel.text = animation.description
            
            animation = Animation.getAnimation()
            runAnimationButton.setTitle("Run \(animation.preset)", for: .normal)
        }
    }
}

private extension ViewController {
    func animateView(_ view: SpringView, with animation: Animation) {
        view.animation = animation.preset
        view.curve = animation.curve
        view.duration = animation.duration
        view.delay = animation.delay
        view.force = animation.force
        view.animate()
    }
}

