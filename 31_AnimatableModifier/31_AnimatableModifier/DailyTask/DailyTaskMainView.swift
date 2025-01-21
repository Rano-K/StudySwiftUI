//
//  DailyTaskView.swift
//  31_AnimatableModifier
//
//  Created by ms k on 1/8/25.
//

import SwiftUI

struct DailyTaskView: View {
                    
    //전체 진행도 변수
    @State var progressAll : Double = 0.5
    @State var componentss =
        [
            ComponentModel(name: "Design", percent: 0.5),
            ComponentModel(name: "Coding", percent: 0.5),
            ComponentModel(name: "Documentation", percent: 0.5),
            ComponentModel(name: "Unit Testing", percent: 0.5),
        ]
    
    
    var body: some View {
        VStack{
            Text("Daily Task")
                .font(.system(size: 30, weight: .black, design: .rounded))
                .multilineTextAlignment(.leading)
                .padding()
                
            OverallProgress(progressAll: $progressAll)
                .padding(.bottom, 20)
            
            Components(componentss: $componentss,
                       onUpdate: {updateProgressAll()}
            )
        }
        
        
        
    }
    
    //FUNC
    private func updateProgressAll(){
        //전체 progress를 componentss의 percent로 계산한 값.
        let totalProgress = componentss.map{$0.percent}.reduce(0, +)
        progressAll = totalProgress / Double(componentss.count)
    }
}


