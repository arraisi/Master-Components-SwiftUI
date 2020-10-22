//
//  LazyHStackView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 20/10/20.
//

import SwiftUI

struct LazyHStackView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(1...10, id: \.self) { count in
                    Text("Test")
                        .frame(width: 300, height: 100, alignment: .center)
                        .background(Color(.cyan))
                }
            }
        }
    }
}

struct LazyHStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStackView()
    }
}
