//
//  Animation.swift
//  RandomAnimation
//
//  Created by Максим Назаров on 19.09.2024.
//

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        Preset: \(preset)
        Curve: \(curve)
        Force: \(String(format: "%.2f", force))
        Duration: \(String(format: "%.2f", duration))
        Delay: \(String(format: "%.2f", delay))
        """
    }
    
    static func getAnimation() -> Animation {
        let data = DataStore.shared
        let animations = Animation(
            preset: data.animations.randomElement() ?? "",
            curve: data.curves.randomElement() ?? "",
            force: Double.random(in: 1...1.5),
            duration: Double.random(in: 0.5...1.5),
            delay: Double.random(in: 0...0.5)
        )
        return animations
    }
}
