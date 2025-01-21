//
//  MultiGridView.swift
//  29_PhotoGrid
//
//  Created by ms k on 12/18/24.
//

import SwiftUI

struct MultiGridView: View {
    
    //기본적으로 GridItem이 하나인 단일 그리드로 초기화.
    @State var gridLayout = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.flexible())
    ]
    //장치 방향 변경 감지하기
    @Environment(\.horizontalSizeClass) var horizontalSizeClass : UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass : UserInterfaceSizeClass?
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxWidth: 150)
                            .cornerRadius(10)
                            .shadow(color: .primary.opacity(0.3), radius: 1)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], content: {
                            ForEach(cafe.coffeePhotos) {photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0, maxWidth : .infinity)
                                    .frame(height : 50)
                                    .cornerRadius(10)
                            }
                        })
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeIn, value: gridLayout.count)
                        
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring, value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button{
                        
                        self.gridLayout = Array(
                            repeating: /*.init(.flexible())*/GridItem(),
                            count: self.gridLayout.count % 4 + 1)
//                        print(self.gridLayout.count)
//                        print(self.gridLayout.count % 4 + 1)
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                    }
                    .tint(.primary)
                })
            })
        }
        .onChange(of: verticalSizeClass){
            self.gridLayout = [GridItem(.adaptive(minimum: verticalSizeClass == .compact ? 100 : 250)), GridItem(.flexible())]
        }
    }
}

