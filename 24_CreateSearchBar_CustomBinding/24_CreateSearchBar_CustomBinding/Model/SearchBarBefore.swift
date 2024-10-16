//
//  SearchBar.swift
//  24_CreateSearchBar_CustomBinding
//
//  Created by ms k on 7/25/24.
//
import SwiftUI

struct SearchBarBefore: UIViewRepresentable {
    
    @Binding var text : String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "검색어를 입력하세요"
        //
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    //UIKit과 SwiftUI의 통신을 위한 text를 binding시킨 Coordinator 인스턴스화.
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    //Coordinator Class선언
    class Coordinator : NSObject, UISearchBarDelegate{
        @Binding var text : String
        
        init(_ text: Binding<String>) {
            self._text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            print("textDidChange : \(text)")
        }
        
        //취소 버튼(Cancel)이 클릭되었을 때 호출.
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = "" //바인딩된 text를 빈 문자열로 바꿈.
            searchBar.resignFirstResponder() // 첫번째 응답자를 포기한다. -> 현재 입력포커스를 받고 있는 뷰(키보드 숨기기)
            searchBar.showsCancelButton = false //검색바의 Cancel버튼을 숨긴다.
            searchBar.endEditing(true)//검색바가 편집을 종료하도록 한다.-> 모든 하위 뷰의 편집을 종료하도록한다.
        }
        
        //검색바가 편집을 시작하기 전에 호출된다.
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.showsCancelButton = true //cancel버튼이 나타나도록 한다.
            return true //검색바가 편집을 시작하도록 허용한다.이 메서드가 true를 반환하면 검색바가 편집 상태로 전환된다.
        }
    }
    
    
}


