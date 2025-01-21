//
//  TestView.swift
//  29_LazyGrid_Layout
//
//  Created by ms k on 12/12/24.
//

import SwiftUI

struct TestView: View {
    
    private var symbols = [
        "keyboard", "desktopcomputer", "headphones",
        "hifispeaker.fill", "tv.music.note", "mic",
        "printer.fill", "plus.bubble", "tv.fill", "video"
    ]
    
    private var colors : [Color] = [.yellow, .purple, .green]
    
    //GirdItem 배열 생성
//    private var gridItemLayout = [
//        GridItem(.flexible(), spacing: 0),
//        GridItem(.flexible(), spacing: 0),
//        GridItem(.flexible(), spacing: 0),
//    ]
//    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
//    private var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
//    private var gridItemLayout = [
//        GridItem(.fixed(100)),
//        GridItem(.fixed(150)),
//    ]
    private var gridItemLayout = [
        GridItem(.fixed(30)),
        GridItem(.flexible()),
        GridItem(.adaptive(minimum: 50))
    ]

    var body: some View {
        //3열 그리드 만들어보기
        ScrollView(.horizontal, content: {
            LazyHGrid(rows: gridItemLayout, spacing: 0, content: {
                ForEach((0...9999), id: \.self, content: { index in
                    Image(systemName: symbols[index % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[index % colors.count])
                        .cornerRadius(10)
                })
            })
        })
    }
}
