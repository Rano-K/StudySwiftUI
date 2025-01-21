//
//  TripDetailView.swift
//  27_Image_Carousel
//
//  Created by ms k on 11/27/24.
//

import SwiftUI

struct TripDetailView: View {
    
    let destination : String
//    @State private var isBookmark : Bool = false
    
    var body: some View {
        //
        GeometryReader{ geometry in
            ScrollView(content: {
                ZStack{
                    VStack(alignment: .leading, spacing: 5, content: {
                        //제목, 평점
                        VStack(alignment: .leading, content: {
                            Text(self.destination)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.heavy)
                            
                            HStack(spacing: 3, content: {
                                ForEach(1...5, id: \.self){_ in 
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .font(.system(size: 15))
                                }
                                Text("5.0")
                                    .font(.system(.headline))
                                    .padding(.leading, 10)
                            })//HStack
                        })//VStack
                        .padding(.bottom, 30)
                        
                        //설명
                        Text("Description")
                            .font(.system(.headline))
                            .fontWeight(.medium)
                        
                        Text("""
                        DetailText
                        """)
                        .padding(.bottom, 40)
                        
                        //BookNow버튼
                        Button(action: {
                            
                        }, label: {
                            Text("Book Now")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color(red: 0.97, green: 0.369, blue: 0.212))
                                .cornerRadius(20)
                        })
                    })//VStack
                    .padding()
                    .background(.white.opacity(0.5))
                    .cornerRadius(20)
                    
                    
                    //북마크 image
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(Color(red: 0.97, green: 0.369, blue: 0.212))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                        .offset(x: -15, y: -5)
                }//ZStack
                .offset(y: 15)
            })
        }
    }
}
