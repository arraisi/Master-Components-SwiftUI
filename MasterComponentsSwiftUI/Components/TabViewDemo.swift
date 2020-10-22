//
//  TabView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 20/10/20.
//

import SwiftUI

struct TabViewDemo: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView{
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(dataATM) {
                        CollectionCellView(atm: $0)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .tabViewStyle(PageTabViewStyle())
                
                Button(action: {
                    withAnimation{
                        selectedTab = 2

                    }
                }, label: {
                    Text("Button")
                })
            }
            .background(Color(.gray))
        }
       
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
