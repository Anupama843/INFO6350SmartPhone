//
//  TableViewCell.swift
//  Assignment2
//
//  Created by Anupama Singh on 2/5/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
