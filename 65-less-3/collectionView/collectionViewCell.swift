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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }


    func xibSetup()
    {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizesSubviews = true
        addSubview(view)
    }


    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "collectionViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

        return view
    }
    func setup(){
           self.topLable.text = "weoqienqwjkenqiwebqwebqjweklqwebqwjebqjkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb"
           self.bottomLable.text = "adlasndjaksbds;as;idbai;sdbai;sdba;sdba;sdas;dbausdbau;sda;usdba;usdas;dbasdbaus"
       }

    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }

}
