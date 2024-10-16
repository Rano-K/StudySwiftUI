//
//  SearchBar.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//

import SwiftUI

struct SearchBar : View{
    
    @State private var isEditing : Bool = false
    
    //커스텀 바인딩
    @Binding var text : String
    private var searchText : Binding<String>{
        Binding<String>(
            get: {
                self.text.capitalized
            }, set: {
                self.text = $0
            }
        )
    } //이제 커스텀 바인딩을 적용하려면 TextField의 매개변수를 수정하고 searchcText를 바인딩으로 전달해야 한다.
    
    var body: some View {
        HStack{
//            TextField("검색어를 입력하세요", text : $text)
            TextField("검색어를 입력하세요", text : searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing{
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 8)
                            })
                        }
                    }
                }
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation{
                        self.isEditing = true
                    }
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .top))
            }
            
            
        }
    }
}
