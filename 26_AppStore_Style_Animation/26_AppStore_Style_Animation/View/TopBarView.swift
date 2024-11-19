//
//  TopBarView.swift
//  26_AppStore_Style_Animation
//
//  Created by ms k on 11/19/24.
//

import SwiftUI

struct TopBarView: View {
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, content: {
            VStack(alignment: .leading, content: {
                Text(getCurrentData().uppercased())
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            })
            Spacer()
            AvartarView(image: "테두리3", width: 40, height: 40)
        })
    }
    
    //날짜변환 함수
    func getCurrentData(with format : String = "EEEE, MMM d") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct AvartarView : View{
    
    let image : String
    let width : CGFloat
    let height : CGFloat
    
    var body: some View{
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
            })
        
    }
}
