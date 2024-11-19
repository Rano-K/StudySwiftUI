//
//  ArticleCardVIew.swift
//  SwiftUIAppStore
//
//  Created by ms k on 11/5/24.
//

import SwiftUI

struct ArticleExcerptView: View {
    
    let category : String
    let headline : String
    let subHeadline : String
    @Binding var isShowContent : Bool //true일 때 전체, false일 때 요약
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Spacer()
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(content: {
                    HStack{
                        VStack(alignment: .leading, content: {
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.secondary)
                            Text(self.headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if !self.isShowContent {
                                Text(self.subHeadline)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        })
                        .padding()
                        Spacer()
                    }
                })
                
        })
        .foregroundStyle(.white)
    }
}

#Preview("Article Excerpt View with subheadline",
         traits: .fixedLayout(width: 380, height: 500)) {
    ArticleExcerptView(
        category: sampleArticles[0].category,
        headline: sampleArticles[0].headline,
        subHeadline: sampleArticles[0].subHeadline,
        isShowContent: .constant(false)
    )
}

#Preview("Article Excerpt View",
         traits: .fixedLayout(width: 380, height: 500)) {
    ArticleExcerptView(
        category: sampleArticles[0].category,
        headline: sampleArticles[0].headline,
        subHeadline: sampleArticles[0].subHeadline,
        isShowContent: .constant(true)
    )
}
