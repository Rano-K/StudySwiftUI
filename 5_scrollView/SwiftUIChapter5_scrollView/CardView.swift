//
//  CardView.swift
//  SwiftUIChapter5_scrollView
//
//  Created by ms k on 4/17/24.
//

import SwiftUI

struct CardView: View {
    var image : String
    var category : String
    var heading : String
    var author : String
    
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading){
                Text(category)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Text(heading)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .lineLimit(3)
                    .minimumScaleFactor(0.1)
                
                Text("Written by \(author)".uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
//                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 1), lineWidth: 1)
                .stroke(Color(.black).opacity(0.2), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

#Preview {
    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Rano")
}
