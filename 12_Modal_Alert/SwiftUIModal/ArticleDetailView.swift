//
//  ArticleDetailView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var article: Article
    @Environment(\.dismiss) var dismiss
    @Binding var isAlert :Bool
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .overlay(
            HStack{
                Spacer()
                
                VStack{
                    Button(action: {
                        self.isAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                    })
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.trailing, 20)
                    .padding(.top, 40)
                    Spacer()
                }
            }
        )
        .alert(isPresented: $isAlert){
            Alert(title: Text("reminder"), 
                  message: Text("Are you sure you finish reading the article?"),
                  primaryButton: .default(Text("YES"), action: {dismiss()}),
                  secondaryButton: .cancel(Text("NO"))
                  
            )
            
        }
        .edgesIgnoringSafeArea(.top)
            
        
        
        
    }
}

