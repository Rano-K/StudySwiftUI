//
//  MenuItem.swift
//  28_Expandable_ListView(OutlineGroup)
//
//  Created by ms k on 12/3/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    
    var id = UUID()
    var name : String
    var image : String
    var subMenuItems : [MenuItem]?
    
}
// Main menu items
let sampleMenuItems = [
    MenuItem(
        name: "Espresso Machines",
        image: "linea-mini",
        subMenuItems: espressoMachineMenuItems
    ),
    MenuItem(
        name: "Grinders",
        image: "swift-mini",
        subMenuItems: grinderMenuItems
    ),
    MenuItem(
        name: "Other Equipment",
        image: "espresso-ep",
        subMenuItems: otherMenuItems
    )
]
//에스프레소 머신 하위메뉴
let espressoMachineMenuItems = [
    MenuItem(
        name: "Leva",
        image: "leva-x",
        subMenuItems: [
            MenuItem(name: "Leva X", image: "leva-x"),
            MenuItem(name: "Leva S", image: "leva-s")
        ]
    ),
    MenuItem(
        name: "Strada",
        image: "strada-ep",
        subMenuItems: [
            MenuItem(name: "Strada EP", image: "strada-ep"),
            MenuItem(name: "Strada AV", image: "strada-av"),
            MenuItem(name: "Strada MP", image: "strada-mp"),
            MenuItem(name: "Strada EE", image: "strada-ee")
        ]
    ),
    MenuItem(name: "KB90", image: "kb90"),
    MenuItem(
        name: "Linea",
        image: "linea-pb-x",
        subMenuItems: [
            MenuItem(name: "Linea PB X", image: "linea-pb-x"),
            MenuItem(name: "Linea PB", image: "linea-pb"),
            MenuItem(name: "Linea Classic", image: "linea-classic")
        ]
    ),
    MenuItem(name: "GB5", image: "gb5"),
    MenuItem(
        name: "Home",
        image: "gs3",
        subMenuItems: [
            MenuItem(name: "GS3", image: "gs3"),
            MenuItem(name: "Linea Mini", image: "linea-mini")
        ]
    )
]

//그라인더 메뉴 하위메뉴
let grinderMenuItems = [
    MenuItem(name: "Swift", image: "swift"),
    MenuItem(name: "Vulcano", image: "vulcano"),
    MenuItem(name: "Swift Mini", image: "swift-mini"),
    MenuItem(name: "Lux D", image: "lux-d")
]

//기타장비 메뉴 하위메뉴
let otherMenuItems = [
    MenuItem(name: "Espresso AV", image: "espresso-av"),
    MenuItem(name: "Espresso EP", image: "espresso-ep"),
    MenuItem(name: "Pour Over", image: "pourover"),
    MenuItem(name: "Steam", image: "steam")
]

