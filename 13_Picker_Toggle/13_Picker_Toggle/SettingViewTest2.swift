//
//  SettingViewTest2.swift
//  13_Picker_Toggle
//
//  Created by ms k on 5/3/24.
//

import SwiftUI

struct SettingViewTest2: View {
    
    @State var toggling : Bool = false
    
    var body: some View {
        NavigationStack{
            Form{
                Toggle(isOn: $toggling){
                    Text("toggling")
                }
                .onChange(of :toggling){
                    if toggling {
                        print("toggleON")
                    }else{
                        print("toggleOFF")
                    }
                }
                
                Button{
                    print("saved")
                }label: {
                    Text("Save Changes")
                }
            }
            .navigationTitle(Text("Settings"))
            List{
                Section{
                    Toggle(isOn: $toggling){
                        Text("toggling")
                    }
                    .onChange(of :toggling){
                        if toggling {
                            print("toggleON")
                        }else{
                            print("toggleOFF")
                        }
                    }
                    
                    Button{
                        print("saved")
                        
                    }label: {
                        Text("Save Changes")
                    }
                    
                }
            }
            .navigationTitle(Text("Settings"))
        }
        
        
        
    }
}


