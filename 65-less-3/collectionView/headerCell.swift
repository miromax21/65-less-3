//
//  headerCell.swift
//  65-less-3
//
//  Created by maxim mironov on 14.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
//
//  headerCell.swift
//  65-less-3
//
//  Created by maxim mironov on 14.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewHeaderCell: UICollectionViewCell, MyCollectionViewHeaderCell {
    let IDENTIFIER = "headerCell"
    
    @IBOutlet weak var headerLabel: UILabel!
    var view:UIView!
    
    override init(frame : CGRect)
    {
        super.init(frame: .zero)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func setup(title: String, text: String) {
        headerLabel.text =  title
    }
    
    fileprivate func xibSetup()
    {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizesSubviews = true
        addSubview(view)
    }
    
    fileprivate func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: IDENTIFIER, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}


