//
//  collectionViewCell.swift
//  65-less-3
//
//  Created by maxim mironov on 07.09.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import Foundation
import UIKit
class CollectionViewCell: UICollectionViewCell{
    var view:UIView!
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var bottomLable: UILabel!
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func setup(title:String,text:String){
        self.topLable.text = title
        self.bottomLable.text =  text
    }
    
    
    fileprivate func xibSetup()
    {
        view = loadViewFromNib()
     //   view.frame = self.bound
        view.autoresizesSubviews = true
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 20),
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 10)])


        
    }
    
    fileprivate func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "collectionViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

