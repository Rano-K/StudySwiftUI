//
//  ContentView.swift
//  19_Gesture_Animation_(tinderUI)
//
//  Created by ms k on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    
    //default dragState를 inactive로 설정
    @GestureState private var dragState = DragState.inactive
    //Drag 임계값을 설정한다.
    private let dragThreshold : CGFloat = 80.0
    
    @State var cardViews : [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(image: trips[index].image,
                                  title: trips[index].destination))
        }
        return views
    }()
    
    //카드 두개중 마지막 카드를 추적하기 위한 상태변수
    @State private var lastIndex = 1
    
    //trainsition을 유지하는 상태속성 정의
    @State private var removalTransition = AnyTransition.trailingBottom
    
    var body: some View {
        VStack {
            TopMenuBarViewModel()
            ZStack{
                ForEach(cardViews) {cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
//                        .offset(x: self.dragState.translation.width, y: self.dragState.translation.height)
                        .overlay{
                            ZStack{
                                Image(systemName: "x.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width  <
                                             -self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                                Image(systemName: "heart.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width >
                                             self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
//                        .scaleEffect(self.dragState.isDragging ? 0.95 : 1.0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.95 : 1.0)
//                        .rotationEffect(Angle(degrees: Double(self.dragState.translation.width / 10)))
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 10): 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 50), value: self.dragState.translation)
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                                 //DragGesture
                            .updating(self.$dragState, body: {(value, state, transaction) in
                                switch value{
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                 //사라질 때 효과 주기
                            .onChanged({ (value) in
                                guard case .second(true, let drag?) = value else{
                                    return
                                }
                                if drag.translation.width < -self.dragThreshold{
                                    self.removalTransition = .leadingBottom
                                }
                                if drag.translation.width > self.dragThreshold{
                                    self.removalTransition = .trailingBottom
                                }
                            })
                                 //카드 바꾸기
                            .onEnded({(value) in
                                guard case .second(true, let drag?) = value else{
                                    return
                                }
                                if drag.translation.width < -self.dragThreshold ||
                                    drag.translation.width > self.dragThreshold{
                                    self.moveCard()
                                }
                            })
                        )
                        
                }
            }
            Spacer(minLength: 20)
            BottomMenuBarViewModel()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)

        }
        .padding()
    }
    //================FUNCTION===============
    
    //Function1. CardView의 배열에서 사용할 수 있는 zIndex를 역순으로 만들어주는 함수
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id})
        else{
            return false
        }
        return index == 0
    }
    
    //카드 뷰를 제거하고 삽입하는 함수
    private func moveCard(){
        cardViews.removeFirst()
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        print("lastIndex = \(lastIndex)")
        print("trips.count = \(trips.count)")
        print("trip= \(trip)")
        
        let newCardView = CardView(image: trip.image, title: trip.destination)
        cardViews.append(newCardView)
    
    }
}

//extension
//===AnyTransition===
extension AnyTransition{
    static var trailingBottom : AnyTransition{
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom : AnyTransition{
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}

