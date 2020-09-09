//
//  d.swift
//  65-less-3
//
//  Created by maxim mironov on 09.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
//
//  UItableViewEctention.swift
//  l-itinerary
//
//  Created by Princess Max on 19.03.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
extension UITableViewCell{
    class var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell{
    class var identifier: String {
        return String(describing: self)
    }
}
