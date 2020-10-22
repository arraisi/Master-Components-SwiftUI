//
//  CollectionCellView.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 20/10/20.
//

import SwiftUI

struct CollectionCellView: View {
    let atm: ATM
    
    var body: some View {
        atm.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .tag(atm.id)
    }
}

struct CollectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionCellView(atm: dataATM[0])
    }
}
