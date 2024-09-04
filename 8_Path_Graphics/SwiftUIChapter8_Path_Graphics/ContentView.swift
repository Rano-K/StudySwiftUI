//
//  ContentView.swift
//  SwiftUIChapter8_Path_Graphics
//
//  Created by ms k on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            VStack {
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 210, y : 60), control: CGPoint(x: 125, y: 0))
                    path.addLine(to: CGPoint(x: 230, y: 60))
                    path.addLine(to: CGPoint(x: 230, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                    path.closeSubpath()
                }
                .stroke(Color.green, lineWidth: 20)
                .fill(Color.cyan)
                Spacer()
                //Fill and Curve
                Path(){ path in
                    path.move(to: CGPoint(x: 20, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 120))
                    path.addLine(to: CGPoint(x: 230, y: 60))
                    path.addLine(to: CGPoint(x: 230, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                    path.closeSubpath()
                }
                .fill(Color.pink)
                Spacer()
                
                //Fill and Stroke
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                    path.addLine(to: CGPoint(x: 230, y: 60))
                    path.addLine(to: CGPoint(x: 230, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                    path.closeSubpath()
                }
                .fill(Color.purple)
                .stroke(Color.black, lineWidth: 5)
                Spacer()
                
                
                
        
        }
        .padding()
        
        //반원형 아크 만들기
        /*
         center: 원의 중심점
         radius: 아크를 만들기 위한 원의 반지름
         startAngle: 아크의 시작 각도
         endAngle: 아크의 종료 각도
         clockwise: 아크를 그리는 방향
         */
        VStack{
            Path() { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 90), clockwise: false)
            }
        }
    }
}
