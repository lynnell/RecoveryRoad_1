//
//  RatingFat.swift
//  RecoveryRoad1
//
//  Created by Lynnell on 12/20/15.
//  Copyright © 2015 Lynnell. All rights reserved.
//

import UIKit

class RatingFat: UIView {

    // MARK: Properties
    
    var ratingFat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingFatButtons = [UIButton]()
    
    var spacing = 5
    
    var stars = 5
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyFatImage = UIImage(named: "emptyFat")
        let filledFatImage = UIImage(named: "filledFat")
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyFatImage, forState: .Normal)
            button.setImage(filledFatImage, forState: .Selected)
            button.setImage(filledFatImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingFatButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in ratingFatButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        ratingFat = ratingFatButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingFatButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < ratingFat
        }
    }
    
}
