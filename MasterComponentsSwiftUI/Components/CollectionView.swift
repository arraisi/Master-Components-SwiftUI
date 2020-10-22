//
//  CollectionView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 20/10/20.
//

import SwiftUI

struct CollectionView: View {
    @State private var scrollTarget: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { (proxy: ScrollViewProxy) in
                        HStack {
                            ForEach(dataATM) {
                                CollectionCellView(atm: $0)
                                // Uniquely identify each row in the scrollview by its index
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        // Scroll to the desired row when the @State variable changes
                        .onChange(of: scrollTarget, perform: { target in
                            if let target = target {
                                scrollTarget = nil
                                
                                withAnimation {
                                    proxy.scrollTo(target, anchor: .center)
                                }
                            }
                        })
                    }
                }
                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(0..<10) { i in
//                            Button("Row \(i * 10)") {
//                                // Store the desired scroll index
//                                scrollTarget = i * 10
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                    .padding(.vertical, 4)
//                }
                
                Button(action: {
                    scrollTarget = scrollTarget == 2 ? nil : 2
                }, label: {
                    Text("Button")
                })
            }
            .navigationTitle("Scroll Example")
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
