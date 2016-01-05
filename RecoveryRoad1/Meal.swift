//
//  Meal.swift
//  RecoveryRoad1
//
//  Created by Lynnell on 12/12/15.
//  Copyright © 2015 Lynnell. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        static let ratingProtein = "ratingProtein"
        static let ratingMilk = "ratingMilk"
        static let ratingGrain = "ratingGrain"
        static let ratingVeg = "ratingVeg"
        static let ratingFruit = "ratingFruit"
        static let ratingFat = "ratingFat"
        static let ratingDessert = "ratingDessert"
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var ratingProtein: Int
    var ratingMilk: Int
    var ratingGrain: Int
    var ratingVeg: Int
    var ratingFruit: Int
    var ratingFat: Int
    var ratingDessert: Int
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int, ratingProtein: Int, ratingMilk: Int, ratingGrain: Int, ratingVeg: Int, ratingFruit: Int, ratingFat: Int, ratingDessert: Int) { //this is a "failable initiailizer" meaning it can return after initiailization.
    
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        self.ratingProtein = ratingProtein
        self.ratingMilk = ratingMilk
        self.ratingGrain = ratingGrain
        self.ratingVeg = ratingVeg
        self.ratingFruit = ratingFruit
        self.ratingFat = ratingFat
        self.ratingDessert = ratingDessert
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 || ratingProtein < 0 || ratingMilk < 0 || ratingGrain < 0 || ratingVeg < 0 || ratingFruit < 0 || ratingFat < 0 || ratingDessert < 0{
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        aCoder.encodeInteger(ratingProtein, forKey: PropertyKey.ratingProtein)
        aCoder.encodeInteger(ratingMilk, forKey: PropertyKey.ratingMilk)
        aCoder.encodeInteger(ratingGrain, forKey: PropertyKey.ratingGrain)
        aCoder.encodeInteger(ratingVeg, forKey: PropertyKey.ratingVeg)
        aCoder.encodeInteger(ratingFruit, forKey: PropertyKey.ratingFruit)
        aCoder.encodeInteger(ratingFat, forKey: PropertyKey.ratingFat)
        aCoder.encodeInteger(ratingDessert, forKey: PropertyKey.ratingDessert)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        let ratingProtein = aDecoder.decodeIntegerForKey(PropertyKey.ratingProtein)
        let ratingMilk = aDecoder.decodeIntegerForKey(PropertyKey.ratingMilk)
        let ratingGrain = aDecoder.decodeIntegerForKey(PropertyKey.ratingGrain)
        let ratingVeg = aDecoder.decodeIntegerForKey(PropertyKey.ratingVeg)
        let ratingFruit = aDecoder.decodeIntegerForKey(PropertyKey.ratingFruit)
        let ratingFat = aDecoder.decodeIntegerForKey(PropertyKey.ratingFat)
        let ratingDessert = aDecoder.decodeIntegerForKey(PropertyKey.ratingDessert)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating, ratingProtein: ratingProtein, ratingMilk: ratingMilk, ratingGrain: ratingGrain, ratingVeg: ratingVeg, ratingFruit: ratingFruit, ratingFat: ratingFat, ratingDessert: ratingDessert)
    }

    
}
