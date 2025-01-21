//
//  ParticleSystem.swift
//  30_AnimationRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import Foundation
import SwiftUI

class ParticleSystem{
    let image = Image("spark")
    var particles = Set<Particle>()
    var center = UnitPoint.center
    var hue = 0.0
    
    func update(date: TimeInterval){
        let deathDate = date - 5
    
        
        for particle in particles {
            if particle.creationDate < deathDate {
                particles.remove(particle)
            }
        }
        
        
        let newParticle = Particle(x: center.x, y: center.y, hue: hue)
        particles.insert(newParticle)
        hue += 0.005
        if hue > 1 { hue -= 1 }
    }
}
