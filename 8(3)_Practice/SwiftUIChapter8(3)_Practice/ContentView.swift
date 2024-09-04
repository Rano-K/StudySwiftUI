//
//  ContentView.swift
//  SwiftUIChapter8(3)_Practice
//
//  Created by ms k on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path(){ path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 40))
                path.addLine(to: CGPoint(x: 200, y: 40))
                path.addLine(to: CGPoint(x: 200, y: 0))
                path.addQuadCurve(to: CGPoint(x: 0, y: 0), control: CGPoint(x: 100, y: -20))
            }
            .fill(Color(.green))
            
            //addRect사용 - 위랑 동일한 모양을 만들 수 있음
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
                path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
                path.move(to: CGPoint(x: 0, y: 40))
                path.addQuadCurve(to: CGPoint(x: 200, y: 40), control: CGPoint(x: 100, y: 60))
            }
            
            
        }
        .padding()
        HStack{
            Button(action: {
                //action to perform
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.black)
                    .frame(width: 150, height: 100)
                    .background(Dome().fill(Color.red))
            })
            //===============================================
            Button(action: {
                //action to perform
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.black)
                    .frame(width: 150, height: 100)
                    .background(Dome2().fill(Color.blue))
            })

        }
        
    }
}
//Shape Struct만들기
struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint( x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

struct Dome2: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        path.move(to: CGPoint(x: 0, y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: rect.size.height), control: CGPoint(x: rect.size.width/2, y: (rect.size.width * 0.75)))
        return path
//        Path() { path in
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
//            path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
//            path.move(to: CGPoint(x: 0, y: 40))
//            path.addQuadCurve(to: CGPoint(x: 200, y: 40), control: CGPoint(x: 100, y: 60))
//        }
    }
}
