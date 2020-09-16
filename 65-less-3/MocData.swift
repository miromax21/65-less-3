//
//  MocData.swift
//  65-less-3
//
//  Created by maxim mironov on 14.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
class MocData {
    var items : [MocDataItem] = [
        MocDataItem(type: .header, title: "asdasdasdasdas sadasd asd asd asd ", text: "sddsadas da das da d asd asd asd as das da sda sda sd asd asd ad a dsa sda111"),
        MocDataItem(title: "asdasdasdasdas sadasd asd asd asd ", text: "sddsadas da das da d asd asd asd as das da sda sda sd asd asd ad a dsa sda111"),
         MocDataItem(title: "asdasdasdasdas sadasd asd asd asd ", text: "sddsadas da das da d asd asd asd as das da sda sda sd asd asd ad a dsa sda sddsadas da das da d asd asd asd as das da sda sda sd asd asd addsadas da das da d asd asd asd as das da sda sda sd asd asd ad a dsa sda sddsadas da das da d asd asd asd as das da sda sda sd asd asd ad a dsa sda111"),
        MocDataItem(title: "asdasdasdasdas sasd asd ", text: "sd111")
    ]
}

struct MocDataItem{
    var type: MocDataItemType = .cell
    var title : String = ""
    var text: String = ""
    init(type: MocDataItemType = .cell, title: String?,text: String? ) {
        self.type = type
        self.title = title ?? ""
        self.text = text ?? ""
    }
}
enum MocDataItemType{
    case header, cell
}
