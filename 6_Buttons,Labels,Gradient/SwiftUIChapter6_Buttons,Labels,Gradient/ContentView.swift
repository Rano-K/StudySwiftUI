//
//  ContentView.swift
//  SwiftUIChapter6_Buttons,Labels,Gradient
//
//  Created by ms k on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                //button01
                Button(action: {
                    print("hello")
                }, label: {
                    Text("TestButton1")
                        .fontWeight(.black)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundStyle(.white)
                        .padding(10)
                        .border(Color.purple, width: 5)
                    
                    
                })
                .buttonBorderShape(.roundedRectangle(radius: 30))
                
                //button02
                Button(action: {
                    print("hello")
                }, label: {
                    Text("TestButton2")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                    
                    
                })
                
                //button03 - Button with Images and Text
                Button(action: {
                    print("Delete button tapped")
                }, label: {
                    VStack{
                        Image(systemName: "trash")
                            .padding()
                            .font(.largeTitle)
                            .background(Color.red)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                        Text("Delete")
                            .padding(.top, 10)
                            .font(.title3)
                            .foregroundStyle(.red)
                    }
                })
                
                //button04 - Button with Images and Text Horizontal with using Group
                Button(action: {
                    print("Delete button2 tapped")
                }, label: {
                    HStack(spacing: 10){
                        Group{
                            Image(systemName: "trash")
                            
                            Text("Delete")
                            
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(40)
                })
                
                //button05 - Label 을 사용하면 이미지, text를 나란히 배치가 가능. HStack대신에 Label을 사용
                Button(action:{
                    print("using Label")
                }){
                    Label(
                        
                        title: {
                            Text("Deletes")
                            
                        },
                        icon: {
                            Image(systemName: "trash")
                            
                        }
                    )
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(40)
                    
                    
                }
                
                //button06 - Gradient Button
                Button(action: {
                    print("Gradient Button tapped")
                }) {
                    Label(
                        title: {
                            Text("Grdient Button")
                        },
                        icon: {
                            Image(systemName: "trash")
                            
                        }
                        
                    )
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
//                    .background(Color.red)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(40)
                }
                
                //button 07 - Assets 에서 ColorSet을 지정후 해당 ColorSet을 가져다 쓰는 버튼
                Button(action: {
                    print("ColorSet Button tapped")
                }) {
                    Label(
                        title: {
                            Text("ColorSet Button")
                        },
                        icon: {
                            Image(systemName: "paperplane.fill")
                            
                        }
                        
                    )
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
//                    .background(Color.red)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("TestColor"), Color.indigo]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .shadow(color :.gray, radius: 40, x:20, y:10)
                }
                

                
                //Button08 - 전체너비 버튼
                Button(action: {
                    print("큰버튼 - 관심끌기 쉬움")
                }){
                    HStack{
                        Group{
                            Image(systemName: "field.of.view.wide.fill")
                            Text("WideButton")
                        }
                        .font(.title)
                        .fontWeight(.black)
                            
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("TestColor"), Color.indigo]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                }
                .padding(.top, 50)
                
                //Button08 - 둥근 전체너비 버튼
                Button(action: {
                    print("큰버튼 - 관심끌기 쉬움")
                }){
                    HStack{
                        Group{
                            Image(systemName: "field.of.view.wide.fill")
                            Text("WideButton")
                        }
                        .font(.title)
                        .fontWeight(.black)
                            
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("TestColor"), Color.indigo]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                }
                .cornerRadius(40)
                .padding(.horizontal, 20)
                
                //Button09 - 내가만든 버튼스타일을 적용하는 버튼
                Button(action: {
                    print("myButtonStyle01")
                }){
                    HStack{
                        Group{
                            Image(systemName: "shareplay")
                            Text("MyButtonStyle01")
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(GrdientButtonBackGroundStyle())
                
                Button(action: {
                    print("myButtonStyle01")
                }){
                    HStack{
                        Group{
                            Image(systemName: "figure.hockey")
                            Text("MyButtonStyle02")
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(GrdientButtonBackGroundStyle())
                
                Button(action: {
                    print("myButtonStyle01")
                }){
                    HStack{
                        Group{
                            Image(systemName: "figure.taichi")
                            Text("MyButtonStyle03")
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(GrdientButtonBackGroundStyle())
                
                //Button 9 - 회전 하는 아이콘
                Button(action: {
                    print("Rotate")
                }){
                    VStack{
                        Image(systemName: "plus")
//                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                .buttonStyle(RotationButtonBackGroundStyle())
            
    

                
                
            }
        }
    }
}

struct GrdientButtonBackGroundStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("TestColor"), Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct RotationButtonBackGroundStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .padding()
            .background(Color("TestColor"))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .rotationEffect(configuration.isPressed ? Angle(degrees: 90.0) : Angle(degrees: 180))
    }
}


