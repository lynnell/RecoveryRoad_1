//
//  MealTableViewCell.swift
//  RecoveryRoad1
//
//  Created by Lynnell on 12/13/15.
//  Copyright © 2015 Lynnell. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
   
    @IBOutlet weak var ratingFruit: RatingFruit!
    
    @IBOutlet weak var ratingMilk: RatingMilk!
    
    @IBOutlet weak var ratingDessert: RatingDessert!
    
    @IBOutlet weak var ratingProtein: RatingProtein!
    
    @IBOutlet weak var ratingGrain: RatingGrain!
    
    @IBOutlet weak var ratingVeg: RatingVeg!
    
    @IBOutlet weak var ratingFat: RatingFat!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
