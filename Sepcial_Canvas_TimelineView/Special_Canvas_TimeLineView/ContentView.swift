//
//  ContentView.swift
//  30_AnimationRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var particleSystem = ParticleSystem()
    @State private var motionHandler = MotionManager()
    //대칭 속성
    let options : [(flipX : Bool, flipY : Bool)] = [
        (false, false),
        (true, false),
        (false, true),
        (true, true)
    ]
    
    var body: some View {
        //TimeLine View & Canvas
        TimelineView(.animation) { timeline in
            Canvas{ context, size in
                //drawing code
                let timelineData = timeline.date.timeIntervalSinceReferenceDate
                particleSystem.update(date: timelineData)
                context.blendMode = .plusLighter
//                context.addFilter(.colorMultiply(.orange))
                
                particleSystem.center = UnitPoint(x: 0.5 + motionHandler.roll, y: 0.5 + motionHandler.pitch)
                
                for particle in particleSystem.particles{
                    
                    var contextCopy = context
                    contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
                    //opacity가 살아있는 시간 조정
                    contextCopy.opacity = 1 - (timelineData - particle.creationDate) / 3
                    
                    var xPos = particle.x * size.width
                    var yPos = particle.y * size.height
                    
                    for option in options{
                        //particle의 위치 좌표
                        var xPos = particle.x * size.width
                        var yPos = particle.y * size.height
                        
                        if option.flipX{
                            xPos = size.width - xPos
                        }
                        if option.flipY{
                            yPos = size.height - yPos
                        }
                        
                        contextCopy.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                    }
                    
                    
                    //무지개를 그리려면? addFilter가 아닌 이전 context를 제거해야하는데 minusFilter이런건 없다. Canvas를 새로 그리고 이전건 제거한다.
                    
                    //시간조정 입자
                    //아래 opacity만 조정해서는 기존에 설정되어 있던 입자가 지워진것 처럼 보이지만 ram이나 cpu에는 남아 있어 많은 메모리를 잡아먹는다. 날짜를 잡고 그 이전 날짜는 지우도록 조정해야 한다. -> ParticleSystem.swift의 update() func를 조정
//                    contextCopy.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                    
                    
                    
                }
                
            }
        }
        .gesture(
            DragGesture(minimumDistance: 1)
                .onChanged { drag in
                    particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
                    particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height
                    
                }
            
        )
        .ignoresSafeArea()
        .background(.black)
    }
}
