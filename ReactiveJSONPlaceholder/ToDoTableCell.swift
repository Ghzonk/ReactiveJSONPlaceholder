//
//  ToDoTableCell.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import UIKit

class ToDoTableCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedImage: UIImageView!
    
    
    var viewModel: ToDoCellViewModel? {
        didSet {
            if viewModel == nil {
                return
            }
            titleLabel.text = viewModel!.title
            completedImage.image = viewModel!.completed ? UIImage(named: "check-green") : UIImage(named: "check-gray")
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
