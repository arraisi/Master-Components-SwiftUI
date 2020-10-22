//
//  ContentView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 12/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedItems: [Int] = []
    
    @State var selectedId: Int = 0
    
    var body: some View {
        VStack {
            CheckBoxGroup(items: masterData, markedId: $selectedItems) { (id, marked) in
                print("id : \(id) and marked : \(marked)")
            }
            
            Text("RADIO BUTTON").padding()
            
            RadioButtonGroup(
                items: masterData,
                selectedId: $selectedId) { selected in
                
                print(selected)
                if let i = masterData.firstIndex(where: { $0.id == selected }) {
                    print(masterData[i])
//                    selectedName =  masterData[i].name
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
