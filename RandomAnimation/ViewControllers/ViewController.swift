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
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    
    @IBOutlet var runAnimationButton: UIButton!
    
    private let animations = Animation.getAnimations()
    private var animation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 10
        runAnimationButton.layer.cornerRadius = 10
        
        animation = animations[Int.random(in: 0..<animations.count)]
        
        setAnimationValuesToLabels(animation)
    }

    @IBAction func runAnimationButtonTapped() {
        if runAnimationButton.titleLabel?.text == "Run" {
            animateView(animatedView, with: animation)
            
            animation = animations[Int.random(in: 0..<animations.count)]
            runAnimationButton.setTitle("Run \(animation.preset)", for: .normal)
        } else {
            animateView(animatedView, with: animation)
            
            setAnimationValuesToLabels(animation)
            
            animation = animations[Int.random(in: 0..<animations.count)]
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
    
    func setAnimationValuesToLabels(_ animation: Animation) {
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        durationLabel.text = "Duration: \(string(from: animation.duration))"
        delayLabel.text = "Delay: \(string(from: animation.delay))"
        forceLabel.text = "Force: \(string(from: animation.force))"
    }
    
    func string(from value: Double) -> String {
        String(format: "%.2f", value)
    }
}

