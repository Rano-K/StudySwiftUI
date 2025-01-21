//
//  OverallComponent.swift
//  31_AnimatableModifier
//
//  Created by ms k on 1/10/25.
//

import SwiftUI
import Foundation

///name 옆에는 percent가 표시되고
///하단의 slider를 통해 percent가 조절된다.
///percentText는 percent를 표시하기위한 데이터일 뿐이며
///slider를 통해 percent를 조절한다는 것이 핵심.
struct ComponentModel : Identifiable{
    var id = UUID()
    var name : String
    var percent : Double
    var percentText : String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: percent)) ?? ""
    }
}

struct Components : View{
    
    @Binding var componentss : [ComponentModel]
    let onUpdate : () -> Void //초기화.
    
    var body: some View {
        ForEach($componentss){ $compo in
            VStack{
                HStack{
                    Text(compo.name)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                    Text(compo.percentText)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                HStack{
                    Text("0%")
                    Slider(value: $compo.percent, in: 0...1, step: 0.05)
                        .foregroundStyle(Color(.orange))
                        .onChange(of: compo.percent, {
                            onUpdate()
                        })
                    Text("100%")
                }
                .frame(maxWidth: 370)
                
                
                
            }
            
        }
        .frame(width: 380, height: 80)
        .background(Color.cyan.secondary)
        .clipShape(Rectangle())
        .cornerRadius(20)
    }
}
