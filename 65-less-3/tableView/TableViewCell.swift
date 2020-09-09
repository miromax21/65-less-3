//
//  TableViewCell.swift
//  65-less-3
//
//  Created by maxim mironov on 31.08.2020.
//  Copyright © 2020 maxim mironov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


   // @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var bottomLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }
    func setup(){
        self.topLable.text = "weoqienqwjkenqiwebqwebqjweklqwebqwjebqjkwebqjwebqkwebqkjwebqjkwelqlwebqjlwebqjlwebqwejqwejqweb"
        self.bottomLable.text = "adlasndjaksbds;as;idbai;sdbai;sdba;sdba;sdas;dbausdbau;sda;usdba;usdas;dbasdbaus"
    }

}
