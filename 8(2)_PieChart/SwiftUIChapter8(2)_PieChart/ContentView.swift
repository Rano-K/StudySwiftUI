//
//  ContentView.swift
//  SwiftUIChapter8(2)_PieChart
//
//  Created by ms k on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //ZStack으로 Arc쌓기
        VStack{
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 0.0),
                                endAngle: Angle(degrees: 190),
                                clockwise: true)
                }
                .fill(Color(.systemYellow))
                
                //
                Path(){path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 190),
                                endAngle: Angle(degrees: 110),
                                clockwise: true)
                }
                .fill(Color(.systemTeal))
                
                //
                Path(){path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 110),
                                endAngle: Angle(degrees: 90),
                                clockwise: true)
                }
                .fill(Color(.systemBlue))
                
                //
                Path() {path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 90.0),
                                endAngle: Angle(degrees: 0),
                                clockwise: true)
                }
                .fill(Color(.systemPurple))
                
                
            }
            //특정 세그먼트 강조 - offset modifier를 이용한 특정 세그먼트 위치 재조정
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 0.0),
                                endAngle: Angle(degrees: 190),
                                clockwise: true)
                }
                .fill(Color(.systemYellow))
                
                //
                Path(){path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 190),
                                endAngle: Angle(degrees: 110),
                                clockwise: true)
                }
                .fill(Color(.systemTeal))
                
                //
                Path(){path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 110),
                                endAngle: Angle(degrees: 90),
                                clockwise: true)
                }
                .fill(Color(.systemBlue))
                
                //
                Path(){path in
                    path.move(to: CGPoint(x: 187, y: 187))
                    path.addArc(center: .init(x: 187, y: 187),
                                radius: 150,
                                startAngle: Angle(degrees: 90.0),
                                endAngle: Angle(degrees: 0),
                                clockwise: true)
                    path.closeSubpath()
                }
                .stroke(Color(.black), lineWidth: 20)
                .fill(Color(.systemPurple))
                .offset(x:20, y:20)
                .overlay(
                    Text("25%")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                        .offset(x: 80, y: 80)
                )
            }
            
        }
        
    }
}
