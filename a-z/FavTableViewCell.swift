//
//  FavTableViewCell.swift
//  a-z
//
//  Created by guowei on 2020/8/31.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    var indexPath:Int!
    
   
       
    @IBOutlet weak var chineseVoc: UILabel!
    
    @IBOutlet weak var vocabulary: UILabel!
    
    @IBOutlet weak var tapSpeaker: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapSpeaker(_ sender: UIButton) {
        
    
    }
    
}
