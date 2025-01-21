//
//  OverallProgress.swift
//  31_AnimatableModifier
//
//  Created by ms k on 1/8/25.
//

import SwiftUI

//OverallProgress전체 뷰
struct OverallProgress: View {
    
    @Binding var progressAll : Double
    
    var body: some View {
        HStack{
            Text("Overall \nProgress")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.trailing, 32)
            
            //RingView
            OverallRingView(progressAll: $progressAll)
        }
        .frame(width: 380, height: 150)
        .background(Color(.systemCyan))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
    
    
}







//바깥Ring에 대한 것만.
struct OverallRingView : View {
    
    var thickness : CGFloat = 20.0
    var width : CGFloat = 120.0 //원지름
    var startAngle : Double = -90.0
    
    //ContentView로 부터 받은 progressAll변수
    @Binding var progressAll : Double
    
    //반지름 계산변수
    private var radius : Double{
        Double(width / 2)
    }
    
    //shadow offset계산
    private var overallRingTipShadowOffset : CGPoint{
        let shadowPosition = OverallRingTipPosition(progressAll: progressAll + 0.01)
        let circlePosition = OverallRingTipPosition(progressAll: progressAll)
        
        return CGPoint(
            x: shadowPosition.x - circlePosition.x,
            y: shadowPosition.y - circlePosition.y)
    }
    //Ring관련 END
    //================================
    
    var body: some View {
        ZStack{
            //밑바탕 회색원
            Circle()
                .stroke(Color(.systemGray2), lineWidth: thickness)
            
            //회색원위의 진행도 표시 원
            OverallRingShape(progressAll: progressAll, thickness: thickness)
                .foregroundStyle(.blue)
                .animatableProgressText(progress: progressAll)
            
            //RingTip추가
            OverallRingTip(//현재의 progressAll, 시작각도,
                progressAll: progressAll,
                startAngle: startAngle,
                ringRadius: radius
            )
            .frame(width: thickness, height: thickness)
            .foregroundStyle(progressAll > 0.96 ? .blue : Color.clear)
            .shadow(
                color: progressAll > 0.96 ? Color.black.opacity(0.3) : Color.clear,
                radius: 2,
                x: overallRingTipShadowOffset.x,
                y: overallRingTipShadowOffset.y)
        }
        .frame(width: width, height: width, alignment: .center)
        //animation추가
        .animation(.smooth(duration: 0.7), value: progressAll)
    }
    
    //shadow추가
    private func OverallRingTipPosition(progressAll : Double) -> CGPoint {
        let angle = 360 * progressAll + startAngle
        let angleInRadian = angle * .pi / 180
        
        return CGPoint(x: radius * cos(angleInRadian),
                       y: radius * sin(angleInRadian))
    }
}
//=============Ring관련 START=============
//Ring위에 채움선 구현(%이동)
struct OverallRingShape : Shape{
    
    var progressAll : Double = 0.0
    var thickness : CGFloat = 20.0
    var startAngle : Double = -90.0
    
    
    //progress가 animation되도록 알려주는 변수
    var animatableData: Double{
        get{ progressAll }
        set{ progressAll = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
            radius: min(rect.width, rect.height) / 2.0,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(360 * progressAll + startAngle),
            clockwise: false
        )
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
    
}

//Ring끝부분 구현
struct OverallRingTip : Shape {
    ///progressAll, startAngle, ringRadius를 매개변수로 position계산
    ///위치 계산 후 path.addRoundedRect()로 원의 경로를 그린다
    
    var progressAll : Double = 0.0
    var startAngle : Double = -90.0
    var ringRadius : Double
    
    private var position : CGPoint {
        let angle = 360 * progressAll + startAngle
        let angleInRadian = angle * .pi / 180
        
        return CGPoint(
            x: ringRadius * cos(angleInRadian),
            y: ringRadius * sin(angleInRadian)
        )
    }
    
    var animatableData: Double{
        get{ progressAll }
        set{ progressAll = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard progressAll > 0.0 else{ return path }
        
        let frame = CGRect(
            x: position.x,
            y: position.y,
            width: rect.size.width,
            height: rect.size.height)
        
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        
        return path
    }
}
//=============Ring관련 END=============




