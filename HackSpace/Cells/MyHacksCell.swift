//
//  MyHacksCell.swift
//  HackSpace
//
//  Created by Олеся Максакова on 12.03.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import UIKit

class MyHacksCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var imageStar: UIImageView!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var cantGoClick: UIButton!
    @IBOutlet var cantGoButton: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
