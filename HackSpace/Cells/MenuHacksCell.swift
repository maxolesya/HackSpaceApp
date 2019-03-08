//
//  MenuHacksCell.swift
//  HackSpace
//
//  Created by Олеся Максакова on 21.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class MenuHacksCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    @IBOutlet var labelTitle: UILabel!
    
    @IBOutlet var imageViewHack: UIImageView!
    @IBOutlet var labelDate: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBAction func applyClick(_ sender: Any) {
    }
    
   
    
}
