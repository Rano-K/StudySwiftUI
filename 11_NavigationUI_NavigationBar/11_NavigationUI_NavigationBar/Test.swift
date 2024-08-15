////
////  Test.swift
////  11_NavigationUI_NavigationBar
////
////  Created by ms k on 4/29/24.
////
//
//import SwiftUI
//
//struct Test: View {
//    
//    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
//                   Restaurant(name: "Homei", image: "homei"),
//                   Restaurant(name: "Teakha", image: "teakha"),
//                   Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
//                   Restaurant(name: "Petite Oyster", image: "petiteoyster"),
//                   Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
//                   Restaurant(name: "Po's Atelier", image: "posatelier"),
//                   Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
//                   Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
//                   Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
//                   Restaurant(name: "Homei", image: "upstate"),
//                   Restaurant(name: "Traif", image: "traif"),
//                   Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
//                   Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
//                   Restaurant(name: "Five Leaves", image: "fiveleaves"),
//                   Restaurant(name: "Cafe Lore", image: "cafelore"),
//                   Restaurant(name: "Confessional", image: "confessional"),
//                   Restaurant(name: "Barrafina", image: "barrafina"),
//                   Restaurant(name: "Donostia", image: "donostia"),
//                   Restaurant(name: "Royal Oak", image: "royaloak"),
//                   Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            List{
//                ForEach(restaurants) { restaurant in
//                    NavigationLink(destination: DetailView(restaurant: restaurant)){
//                        BasicImageRow(restaurant: restaurant)
//                    }
//                }
//            }
//            .navigationTitle("Navigation Title")
//            .toolbar {
//                Button("Add") {
//                    
//                }
//            }
//            .toolbarColorScheme(.dark, for: .navigationBar)
//
//            .toolbarBackground(
//                Color.pink,
//                for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
//        }
//    }
//}
//
//
//extension View {
//    func onWillDisappear(_ perform: @escaping () -> Void) -> some View {
//        modifier(ViewWillDisappearModifier(callback: perform))
//    }
//    
//    func onWillAppear(_ perform: @escaping () -> Void) -> some View {
//        modifier(ViewWillAppearModifier(callback: perform))
//    }
//}
//
//struct ViewWillDisappearModifier: ViewModifier {
//    let callback: () -> Void
//    
//    func body(content: Content) -> some View {
//        content.background(UIViewControllerResponder(viewWillDisappear: callback))
//    }
//}
//
//struct ViewWillAppearModifier: ViewModifier {
//    let callback: () -> Void
//    
//    func body(content: Content) -> some View {
//        content.background(UIViewControllerResponder(viewWillAppear: callback))
//    }
//}
//
//private struct UIViewControllerResponder: UIViewControllerRepresentable {
//
//    /// Notifies the view controller that its view is about to be added to a view hierarchy.
//    var viewWillAppear: (() -> Void)? = nil
//    
//    /// Notifies the view controller that its view is about to be removed from a view hierarchy.
//    var viewWillDisappear: (() -> Void)? = nil
//    
//    private let controller = ViewController()
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<UIViewControllerResponder>) -> UIViewController {
//        if let viewWillAppear = viewWillAppear {
//            controller.viewWillAppear = viewWillAppear
//        }
//        
//        if let viewWillDisappear = viewWillDisappear {
//            controller.viewWillDisappear = viewWillDisappear
//        }
//        
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<UIViewControllerResponder>) {
//    }
//
//
//    /// An object that manages a view hierarchy for your UIKit app.
//    private class ViewController: UIViewController {
//        var viewWillAppear: () -> Void = { }
//        var viewWillDisappear: () -> Void = { }
//        
//        /// Notifies the view controller that its view is about to be added to a view hierarchy.
//        /// - Parameter animated: If true, the view is being added to the window using an animation.
//        override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            viewWillAppear()
//            
//        }
//
//        /// /// Notifies the view controller that its view is about to be removed from a view hierarchy.
//        /// - Parameter animated: If true, the view is being added to the window using an animation.
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            viewWillDisappear()
//        }
//    }
//}
