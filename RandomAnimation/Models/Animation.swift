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
    
    static func getAnimations() -> [Animation] {
        let data = DataStore.shared
        var animations: [Animation] = []
        
        for _ in 0...100 {
            animations.append(
                Animation(
                    preset: data.animations[Int.random(in: 0..<data.animations.count)],
                    curve: data.curves[Int.random(in: 0..<data.curves.count)],
                    force: Double.random(in: 1...1.5),
                    duration: Double.random(in: 0.5...5),
                    delay: Double.random(in: 0...1)
                )
            )
        }
        
        return animations
    }
}
