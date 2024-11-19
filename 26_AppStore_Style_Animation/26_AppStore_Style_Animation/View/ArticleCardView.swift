//
//  ArticleCardView.swift
//  26_AppStore_Style_Animation
//
//  Created by ms k on 11/18/24.
//

import SwiftUI

struct ArticleCardView: View {
    
    let category : String
    let headline : String
    let subHeadline : String
    let image : UIImage
    let content : String
    @Binding var isShowContent : Bool
    
    var body: some View {
         GeometryReader(content: {geometry in
            ZStack(alignment: .topTrailing,content: {
                ScrollView(content: {
                    VStack(alignment: .leading, content: {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
    //                        .frame(height: min(self.image.size.height / 3, 500))//이미지 높이 설정. 원본이미지 높이의 1/3이거나 500포인트중 작은 값으로 설정. min()함수를 통해 구축.
                            .frame(width: geometry.size.width, height: min(self.image.size.height / 3, 500))
                        //이미지를 강조하는 프레임 설정.
//                            .frame(width: geometry.size.width,
//                                   height: self.isShowContent ? geometry.size.height * 0.7 : min(self.image.size.height / 3, 500))
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1),
                                    width: self.isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay(content: {
                                ArticleExcerptView(category: self.category,
                                                headline: self.headline,
                                                subHeadline: self.subHeadline,
                                                isShowContent: self.$isShowContent)
                                .cornerRadius(self.isShowContent ? 0 : 15)
                            })
                        
                        //컨텐츠
                        if self.isShowContent{
                            Text(self.content)
                                .foregroundStyle(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .bottom))
                        }
                            
                    })
                })//ScrollView
                .shadow(
                    color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3),
                    radius: self.isShowContent ? 0 : 15)
                if self.isShowContent{
                    HStack{
                        Spacer()
                        Button{
                            withAnimation(.easeOut){
                                self.isShowContent = false
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundStyle(Color.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            })
            
        })
    }
}
