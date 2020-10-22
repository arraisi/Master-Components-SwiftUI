//
//  ATM.swift
//  MasterComponentsSwiftUI
//
//  Created by Abdul R. Arraisi on 20/10/20.
//

import SwiftUI

struct ATM: Identifiable {
  var id: Int
  var name: String
  var image: Image
}

let dataATM: [ATM] = [
    .init(id: 1, name: "Diamond", image: Image("atm_diamond")),
    .init(id: 2, name: "Pearl", image: Image("atm_pearl"))
]
