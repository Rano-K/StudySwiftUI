//
//  ContentView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI
/// swiftUI의 modalView표시 방법
/// 1. boolean값 설정
/// 2. binding하여 해당 값이 있으면 표시
///
///
struct ContentView: View {
    
//    @State var showDetailView = false // 모달 뷰 상태 추적
    @State var selectedArticle: Article? // 사용자의 선택을 저장할 상태 변수
    @State var isAlert : Bool = false
    
    
    
    var body: some View {
        //sheet modifier 적용
        
//        NavigationStack {
//            List(articles) { article in
//                ArticleRow(article1: article)
//                    .onTapGesture {
//                        self.showDetailView.toggle()
//                        self.selectedArticle = article
//                    }
//            }
//            .sheet(isPresented: self.$showDetailView){
//                if let selectedArticle = self.selectedArticle{
//                    ArticleDetailView(article: selectedArticle)
//                }
//            }
//            .navigationBarTitle("Your Reading")
//        }
        
        NavigationStack {
            List(articles) { article in
                ArticleRow(article1: article)
                    .onTapGesture {
//                        self.showDetailView.toggle()
                        self.selectedArticle = article
                    }
            }
            .sheet(item: self.$selectedArticle){article in
                ArticleDetailView(article: article, isAlert: $isAlert)
            }
            .navigationBarTitle("Your Reading")
        }
    }
}


struct ArticleRow: View {
    var article1: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article1.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article1.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article1.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
                
            HStack(spacing: 3) {
                ForEach(1...(article1.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article1.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}
