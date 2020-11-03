//
//  ContentView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 12/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var data = [
        
        Card(id: 0, img: "kartuku_1", name: "KARTU 1", show: false),
        Card(id: 1, img: "kartuku_2", name: "KARTU 2", show: false),
        Card(id: 2, img: "kartuku_3", name: "KARTU 3", show: false)
    ]
    
    @State var index = 0
        
    var body: some View {
        VStack(spacing: 10) {
            InfiniteCarousel(itemWidth: 236, itemHeight: 194, itemGapHeight: 20, views: data) { (index) in
    //            print("views: \(views)")
                print("index: \(index)")
                print(data[index])
                self.index = index
            }
            
            VStack {
                Text("Title \(data[self.index].name)")
                    .padding()
                
                Text("Description \(data[self.index].name)")
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
