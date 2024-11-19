//
//  ContentView.swift
//  26_AppStore_Style_Animation
//
//  Created by ms k on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showContent : Bool = false
    @State private var selectedArticleIndex : Int?
    //namespace정의
    @Namespace var nsArticle
    
    var body: some View {
        ZStack(alignment: .top, content: {
            ScrollView(content: {
                VStack(spacing: 40, content: {
                
                    TopBarView()
                        .padding(.horizontal, 20)
                    
                    ForEach(sampleArticles.indices, id: \.self) {index in
                        ArticleCardView(category: sampleArticles[index].category,
                                        headline: sampleArticles[index].headline,
                                        subHeadline: sampleArticles[index].subHeadline,
                                        image: sampleArticles[index].image,
                                        content: sampleArticles[index].content,
                                        isShowContent: $showContent)
                        .padding(.horizontal, 20)
                        .matchedGeometryEffect(id: index, in: nsArticle)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.1)){
                                self.selectedArticleIndex = index
                                self.showContent.toggle()
                            }
                        }
                        .frame(height: min(sampleArticles[index].image.size.height / 3, 500))
                    }//ForEach
                })//VStack
            })//ScrollView
            .opacity(showContent ? 0 : 1)
            
            //조건부 렌더링 코드
            if showContent, let selectedArticleIndex{
                ArticleCardView(
                        category: sampleArticles[selectedArticleIndex].category,
                        headline: sampleArticles[selectedArticleIndex].headline,
                        subHeadline: sampleArticles[selectedArticleIndex].subHeadline,
                        image: sampleArticles[selectedArticleIndex].image,
                        content: sampleArticles[selectedArticleIndex].content,
                        isShowContent: $showContent
                )
                .matchedGeometryEffect(id: selectedArticleIndex, in: nsArticle)
                .ignoresSafeArea()
            }
            
        })
        
    }
}//ContentView
