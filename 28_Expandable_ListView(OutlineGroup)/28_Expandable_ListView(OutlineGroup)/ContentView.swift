//
//  ContentView.swift
//  28_Expandable_ListView(OutlineGroup)
//
//  Created by ms k on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showFAQ : Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(sampleMenuItems) { menuItem in // ForEach를 통한 반복적인 Section생성.
                    Section( //Section을 구분.
                        header: HStack {
                            Text(menuItem.name)
                                .font(.title3)
                                .fontWeight(.heavy)
                            Image(menuItem.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                            .padding(.vertical)
                    ) { //OutlineGroup을 통해 subMenuItems를 가져온다.
                        OutlineGroup(menuItem.subMenuItems ?? [MenuItem](), children: \.subMenuItems) { item in
                            HStack {
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text(item.name)
                                    .bold()
                                    .font(.system(.title3, design: .rounded))
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                Button(action:{
                    self.showFAQ.toggle()
                }, label: {
                    showFAQ ? Text("FAQ닫기") : Text("FAQ보기")
                })
                
            })
        }
        if showFAQ{
            FaqView()
        }
    }
}
