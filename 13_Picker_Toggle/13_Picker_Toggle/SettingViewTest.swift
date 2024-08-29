//
//  SettingView.swift
//  13_Picker_Toggle
//
//  Created by ms k on 5/1/24.
//

import SwiftUI


enum NotifyMeAboutType{
    case directMessages
    case mentions
    case anything
}

enum ProfileImageSize{
    case large
    case medium
    case small
}

struct SettingViewTest: View {
    
    let sectionsAndItems : [String : [Item]] = [
        "Section1" : [ //sectionAndItems.keys
            Item(name : "Item1"),
            Item(name : "Item2")
        ],
            
        "Section2" : [
            Item(name : "Item3"),
            Item(name : "Item4")
        ]
    ]
    
    @State var notifyMeAbout = NotifyMeAboutType.directMessages
    @State var playNotificationSounds = false
    @State var profileImageSize = ProfileImageSize.large
    @State var sendReadReceipts = false
    
    var body: some View {
        NavigationStack {
            Text("\(sectionsAndItems.keys)")
            Divider()
            List{
                ForEach(Array(sectionsAndItems.keys), id: \.self){section in
                    Section(header: Text(section)){
                        ForEach(sectionsAndItems[section] ?? []){ item in
                            Text(item.name)
                        }
                    }
                }
            }
            
            Form {
                Section(header: Text("Notifications")) {
                  Picker("Notify Me About", selection: $notifyMeAbout) {
                    Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                    Text("Mentions").tag(NotifyMeAboutType.mentions)
                    Text("Anything").tag(NotifyMeAboutType.anything)
                  }
                  Toggle("Play notification sounds", isOn: $playNotificationSounds)
                  Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                  Picker("Profile Image Size", selection: $profileImageSize) {
                    Text("Large").tag(ProfileImageSize.large)
                    Text("Medium").tag(ProfileImageSize.medium)
                    Text("Small").tag(ProfileImageSize.small)
                  }
                  Button("Clear Image Cache") {}
                }
            }
        }
        
    }
}

struct Item : Identifiable{
    let id = UUID()
    let name : String
}
