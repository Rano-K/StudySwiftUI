//
//  ContentView.swift
//  29_PhotoGrid
//
//  Created by ms k on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    
    //Grid레이아웃 정의변수 선언
    @State var gridLayout : [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(samplePhotos.indices, id: \.self) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3) ,radius: 1)
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(
                    response: 0.3, dampingFraction: 1.3, blendDuration: 0.3
                ), value: gridLayout.count)
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
    }
}
