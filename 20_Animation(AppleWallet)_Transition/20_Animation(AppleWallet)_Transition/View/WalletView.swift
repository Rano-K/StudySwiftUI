//
//  WalletView.swift
//  20_Animation(AppleWallet)_Transition
//
//  Created by ms k on 7/3/24.
//  Title Bar, CardDeck을 생성할 곳

import SwiftUI

//TitleBar
struct TopNavBar : View {
    var body: some View {
        HStack{
            Text("Wallet") // 타이틀
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            Spacer()
            Image(systemName: "plus.circle.fill") //플러스 circle
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

struct WalletView: View {
    
    //testCards를 불러올 객체선언(위치를 변경업데이트 하기위해 @State로 선언)
    @State var cards : [Card] = testCards
    //수직offset선언. 카드를 펼치기 위한 용도
    private static let cardOffset : CGFloat = 50.0 //각 카드 간격은 50으로 설정되어 있음.
    //slide-in animation trigger
    @State private var isCardPresented = false
    
    //=======Card선택관련========
    //카드가 눌렸는지 판단
    @State var isCardPressed :Bool = false
    //어떤카드가 선택되었는지
    @State var selectedCard : Card?
    //드래그 상태추적 변수 선언
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack{
            TopNavBar()
                .padding(.bottom)
            Spacer()
            ZStack{
                ForEach(cards) { card in
                    CardView(card: card)
                        .padding(.horizontal, 35)
                        .offset(self.offset(for: card))
                        .zIndex(self.zIndex(for: card))
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .id(isCardPresented)
                        .animation(self.transitionAnimation(for: card ), value: isCardPresented)
                        .gesture(
                            TapGesture()
                                .onEnded{ _ in
                                    withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                        self.isCardPressed.toggle()
                                        self.selectedCard = self.isCardPressed ? card : nil
                                    }
                                }
                                .exclusively(before: LongPressGesture()
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: {(value, state, transaction) in
                                        switch value{
                                        case .first(true):
                                            state = .pressing(index: self.index(for: card))
                                        case .second(true, let drag):
                                            state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                    .onEnded({(value) in
                                        guard case .second(true, let drag?) = value else{
                                            return
                                        }
                                        withAnimation{
                                            self.reArrangeCards(with: card, dragOffset: drag.translation)
                                        }
                                    })
                             )
                        )
                }
            }
            .onAppear{
                isCardPresented.toggle()
            }
            Spacer()
            if isCardPressed{
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.slide)
            }
        }
    }
    //FUNCTION
    //Card의 index를 계산하는 함수
    private func index(for card : Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else{
            return nil
        }
        return index
    }
    //index함수로 부터 받은 return값을 통해 zIndex를 음수로 만들어 순서를 뒤바꾸는 함수
    private func zIndex(for card : Card) -> Double{
        guard let cardIndex = index(for : card) else{
            return 0.0
        }
        //기본적인 z-Indx는 카드의인덱스에 대한 음수 값으로 설정된다.
        let defaultZIndex = -Double(cardIndex)
        //드래그 중인 카드일 경우
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex{
            //변환의 높이를 기반으로 새로운 z-index계산
            return defaultZIndex + Double(dragState.translation.height / Self.cardOffset)
        }
        //그렇지 않으면 기존 zIndex반환
//        return -Double(cardIndex)
        return defaultZIndex
    }
    //주어진 카드의 수직 offset을 계산하는 함수
    //바뀐 offset함수에는 isCardPressed에 따른 내용이 적용된다.
    private func offset(for card: Card) -> CGSize{
        guard let cardIndex = index(for: card) else{
            return CGSize()
        }
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else{
                return .zero
            }
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            let offset = CGSize(width: 0, height: 1400)
            return offset
        }
        //DragGesture()를 위한 함수 업데이트
        var pressedOffset = CGSize.zero
        var dragOffsetY : CGFloat = 0.0
        
        if let draggingIndex = dragState.index, 
          cardIndex == draggingIndex{
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -10: pressedOffset.width = -20
            case let width where width > 10 : pressedOffset.width = 20
            default:
                break
            }
            dragOffsetY = dragState.translation.height
        }
        
//        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
        return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
    //slide-in 애니메이션 함수
    private func transitionAnimation(for card : Card) -> Animation{
        var delay = 0.0
        if let index = index(for: card){
            delay = Double(cards.count - index) * 0.1
        }
        return Animation.spring(response: 0.3, dampingFraction: 1.8, blendDuration: 0.01)
            .delay(delay)
    }
    //카드를 재정렬하기 위한 함수
    private func reArrangeCards(with card : Card, dragOffset : CGSize){
        guard let draggingCardIndex = index(for: card) else{
            return
        }
        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex
        let removeCard = cards.remove(at: draggingCardIndex)
        cards.insert(removeCard, at: newIndex)
    }
}


#Preview {
    WalletView()
}
