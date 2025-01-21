//
//  Particle.swift
//  30_AnimationRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import Foundation

struct Particle : Hashable {
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
    let hue : Double
}
