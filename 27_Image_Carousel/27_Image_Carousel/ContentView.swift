//
//  ContentView.swift
//  27_Image_Carousel
//
//  Created by ms k on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isCardTapped = false //카드 탭했을 때 변하게 할 State
    @State private var currentTripIndex = 1 //CardView의 Index : 값 2는 3번째 View
    
    //DragGesture
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, content: {
                Text("Where to Travel?")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Explore Where To Go")
                    .font(.system(.headline, design: .rounded))
            })
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding(.top, 25)
            .padding(.leading, 25)
            .opacity(self.isCardTapped ? 0.1 : 1.0)
            .offset(y: self.isCardTapped ? -100 : 0) //card가 tab되었을 때 Text의 위치를 변경해야한다.
            
            GeometryReader(content: {outerView in
                HStack(spacing: 0){
                    ForEach(sampleTrips.indices, id: \.self){index in //SampleTrips에 있는 순차별로 index에 담아서 보내주기
                        //GeometryReader로 감싸는 이유? TripCardView의 내용들이 전부 한페이지에 보여지기 때문에.
                        GeometryReader(content: { innerView in  //geometry를 조절할 인자로 innerView
                            TripCardView(destination: sampleTrips[index].destination,
                                         imageName: sampleTrips[index].image,
                                         isShowDetails: self.$isCardTapped)
                            .offset(y: self.isCardTapped ? -innerView.size.height * 0.3 : 0)
                            
                        })
                        .padding(.horizontal, self.isCardTapped ? 0 : 20)
                        .opacity(self.currentTripIndex == index ? 1.0 : 0.7)
                        //선택된 카드만 450, 그 외엔 400
                        .frame(
                            width: outerView.size.width,
                            height: self.currentTripIndex == index
                            ? (self.isCardTapped ? outerView.size.height : 450)
                            : 400)
                        .onTapGesture {
                            withAnimation(.interpolatingSpring(.bouncy, initialVelocity: 0.3)) {
                                self.isCardTapped = true
                            }
                        }
                    }
                }
                .frame(width: outerView.size.width,
                       height: outerView.size.height,
                       alignment: .leading)
                .gesture(
                    !self.isCardTapped
                    ? DragGesture()
                        .updating(self.$dragOffset, body: {(value, state, transaction) in
                            state = value.translation.width
                        })
                        .onEnded({(value) in
                            let threshold = outerView.size.width * 0.65
                            var newIndex = Int(-value.translation.width / threshold) + self.currentTripIndex
                            newIndex = min(max(newIndex, 0), sampleTrips.count - 1)
                            self.currentTripIndex = newIndex
                        })
                    
                    : nil
                )
                .offset(x: -CGFloat(self.currentTripIndex) * outerView.size.width)
                .offset(x: self.dragOffset)
                
            })
            .animation(.interpolatingSpring(.bouncy), value: dragOffset)
    //        .animation(.interpolatingSpring(mass: 1.0,stiffness: 1.0, damping: 0.1), value: dragOffset)
    //        .animation(.interactiveSpring(duration: 2.0), value: dragOffset)
            if self.isCardTapped{
                TripDetailView(destination: sampleTrips[currentTripIndex].destination)
                    .offset(y: 200)
                    .transition(.move(edge: .bottom)) //아래에서 튀어나오도록 transition설정
                
                Button(action: {
                    withAnimation{
                        self.isCardTapped = false
                    }
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                })
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)
            }
        }//ZStack
        
        
        
        
    }
}


