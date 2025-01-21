//
//  ProgressRingView.swift
//  30_ActivityRing(Shape,Animatable)
//
//  Created by ms k on 12/19/24.
//

import SwiftUI

struct RingTip : Shape{
    var progress : Double = 0.0
    var startAngle : Double = -90.0
    var ringRadius : Double
    
    private var position : CGPoint{
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180
        
        return CGPoint(x: ringRadius * cos(angleInRadian),
                       y: ringRadius * sin(angleInRadian))
    }
    
    var animatableData: Double{
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard progress > 0.0 else{
            return path
        }
        
        let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)
        
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        
        return path
    }
}

struct RingShape : Shape{
    var progress : Double = 0.0
    var thickness : CGFloat = 30.0
    var startAngle : Double = -90.0
    
    //progress값이 animation가능하다고 알려주는 역할 변수
    var animatableData: Double{
        get{ progress }
        set{ progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
                    radius: min(rect.width, rect.height) / 2.0,
                    startAngle: .degrees(startAngle),
                    endAngle: .degrees(360 * progress + startAngle),
                    clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}

struct ProgressRingView : View{
    
    var thickness : CGFloat = 30.0
    var width : CGFloat = 250.0
    
    //Gradient뷰 변수
    var gradient = Gradient(colors: [.darkPurple, .lightYellow])
    var startAngle = -90.0
    
    //반지름 계산 변수
    private var radius : Double{
        Double(width / 2)
    }
    
    @Binding var progress : Double
    
    private func ringTipPosition(progress: Double) -> CGPoint{
        
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180
        
        return CGPoint(x: radius * cos(angleInRadian), y: radius * sin(angleInRadian))
    }
    
    private var ringTipShadowOffset : CGPoint{
        let shadowPosition = ringTipPosition(progress: progress + 0.01)
        let circlePosition = ringTipPosition(progress: progress)
        
        return CGPoint(x: shadowPosition.x - circlePosition.x,
                       y: shadowPosition.y - circlePosition.y)
    }

    var body: some View{
        ZStack{
            Circle()
                .stroke(Color(.systemGray2), lineWidth: thickness)
            
            RingShape(progress: progress, thickness: thickness)
                .fill(
                    AngularGradient(
                        gradient: gradient,
                        center: .center,
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(360 * progress + startAngle)
                    )
                )
            
            RingTip(progress: progress, startAngle: startAngle, ringRadius: radius)
                .frame(width: thickness, height: thickness)
                .foregroundStyle(progress > 0.96 ? gradient.stops[1].color : Color.clear)
                .shadow(color: progress > 0.96
                        ? Color.black.opacity(0.3)
                        : Color.clear,
                        radius: 2,
                        x: ringTipShadowOffset.x,
                        y: ringTipShadowOffset.y)
        }
        .frame(width: width, height: width, alignment: .center)
        .animation(.easeInOut(duration: 1.0), value: progress)
    }
    
    
}

