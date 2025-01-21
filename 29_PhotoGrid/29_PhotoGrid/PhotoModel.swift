//
//  PhotoModel.swift
//  29_PhotoGrid
//
//  Created by ms k on 12/16/24.
//

import SwiftUI
import Foundation

//사진데이터 정의 모델
struct PhotoModel: Identifiable {
    //UUID를 사용해 고유한 id를 생성
    var id = UUID()
    var name : String
}
let samplePhotos = (1...20).map{ PhotoModel(name: "coffee-\($0)")}

struct CafeModel : Identifiable{
    var id = UUID()
    var image : String
    var coffeePhotos : [PhotoModel] = []
}

let sampleCafes : [CafeModel] = {
    var cafes = (1...10).map {
        CafeModel(image: "cafe-\($0)")
    }
    for index in cafes.indices{
        let randInt = Int.random(in: (5...12))
        cafes[index].coffeePhotos = (1...randInt).map{
            PhotoModel(name: "coffee-\($0)")
        }
    }
    
    return cafes
}()
