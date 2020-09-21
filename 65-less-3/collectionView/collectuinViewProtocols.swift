//
//  collectuinViewProtocols.swift
//  65-less-3
//
//  Created by maxim mironov on 21.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import UIKit
protocol MyCollectionViewCell {
     func setup(title:String,text:String)
}
protocol MyCollectionViewCellWithImage {
     func setup(title:String,text:String, image: URL?)
}
protocol MyCollectionViewHeaderCell: MyCollectionViewCell{
    
}
