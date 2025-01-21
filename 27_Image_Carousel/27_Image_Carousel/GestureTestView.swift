//
//  GestureTestView.swift
//  27_Image_Carousel
//
//  Created by ms k on 11/27/24.
//

import SwiftUI

struct Player {
    var name: Int
    var isOn: Bool
}

struct PlayerView : View {
    
    var scaled : Bool = false
    var player : Player
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Rectangle()
                .frame(width: 30, height: 160)
                .foregroundStyle(player.isOn ? .green : .white)
                .border(.black)
//                .cornerRadius(5.0)
                .scaleEffect(scaled ? 1.5 : 1.0)
            
            VStack{
                Text(String(player.name))
                    .foregroundStyle(.gray)
            }
            .padding([.top, .leading], 10)
        }
        .zIndex(scaled ? 2 : 1)
    }
}

struct GestureTestView: View {
    
    @GestureState private var location : CGPoint = .zero
    @State private var data : [Player] = [
        Player(name: 0, isOn: false),
        Player(name: 1, isOn: false),
        Player(name: 2, isOn: false),
        Player(name: 3, isOn: false),
        Player(name: 4, isOn: false),
        Player(name: 5, isOn: false),
        Player(name: 6, isOn: false),
        Player(name: 7, isOn: false),
        Player(name: 8, isOn: false),
        Player(name: 9, isOn: false),
        Player(name: 10, isOn: false),
        Player(name: 11, isOn: false),
        Player(name: 12, isOn: false),
        Player(name: 13, isOn: false),
        Player(name: 14, isOn: false),
    ]
    @State private var highlighted : Int? = nil
    
    let rows = [
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true){
            LazyHGrid(rows: rows, alignment: .center, spacing: 2, content: {
                ForEach(0..<data.count, id: \.self){ i in
                    PlayerView(scaled: self.highlighted == i, player: self.data[i])
                        .background(content: {
                            self.rectReader(index: i)
                        })
                        .gesture(
                            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                .updating($location, body: { (value, state, transaction) in
                                    state = value.location
                                })
                                .onEnded({ _ in
                                    self.highlighted = nil
                                })
                        )
                }
            })
            .padding(.vertical, 30)
        }
    }
    
    //Function
    func rectReader(index: Int) -> some View {
            return GeometryReader { (geometry) -> AnyView in
                if geometry.frame(in: .global).contains(self.location) {
//✅ 지금 내가 드레그 하고 있는위치(self.location)가 index번째의 셀영역에 (셀의 배경 영역) 포함되어 있으면 셀의 on/off 를 토글시켜준다
//✅ 맨 처음에 드래그가 배경 영역(rectReader)에 포함될 때는 (self.highlighted != index) 의 경우이므로 토글 시켜주고 그 이후에 드레그가 배경 영역(rectReader) 안에서 움직일 때는 토글 시켜주지 않도록
                    DispatchQueue.main.async {
                        if(self.highlighted != index) {
                            self.data[index].isOn.toggle()
                        }
                        self.highlighted = index
                    }
                }
                return AnyView(Rectangle().fill(Color.clear))
            }
        }
}
