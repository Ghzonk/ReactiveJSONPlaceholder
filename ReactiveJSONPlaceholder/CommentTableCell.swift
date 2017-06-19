//
//  CommentTableCell.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import UIKit

class CommentTableCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyText: UITextView!
    
    
    var viewModel: CommentCellViewModel? {
        didSet {
            if viewModel == nil {
                return
            }
            nameLabel.text = viewModel!.name
            emailLabel.text = viewModel!.email
            bodyText.text = viewModel!.body
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
