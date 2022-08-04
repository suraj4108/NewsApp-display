//
//  CustomTableViewCell.swift
//  NewsApp
//
//  Created by Suraj Singh on 03/08/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var authorOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageOutlet.image = nil
    }

}
