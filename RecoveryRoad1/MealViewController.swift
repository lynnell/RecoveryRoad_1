//
//  MealViewController.swift
//  RecoveryRoad1
//
//  Created by Lynnell on 12/11/15.
//  Copyright © 2015 Lynnell. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate { //Adopting UITextFieldDelegate protocol

    
    // MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var ratingFruit: RatingFruit!
    @IBOutlet weak var ratingProtein: RatingProtein!
    @IBOutlet weak var ratingVeg: RatingVeg!
    @IBOutlet weak var ratingMilk: RatingMilk!
    @IBOutlet weak var ratingFat: RatingFat!
    @IBOutlet weak var ratingDessert: RatingDessert!
    @IBOutlet weak var ratingGrain: RatingGrain!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the text field's user input through delegate callbacks.
        
        nameTextField.delegate = self   //self refers to the ViewController class
                                        //By adopting the protocol UITextFieldDelegate, it gives ViewController the ability to identify itself as a UITextFieldDelegate
        // Set up views if editing an existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text   = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
            ratingProtein.ratingProtein = meal.ratingProtein
            ratingFruit.ratingFruit = meal.ratingFruit
            ratingVeg.ratingVeg = meal.ratingVeg
            ratingMilk.ratingMilk = meal.ratingMilk
            ratingFat.ratingFat = meal.ratingFat
            ratingDessert.ratingDessert = meal.ratingDessert
            ratingGrain.ratingGrain = meal.ratingGrain
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        checkValidMealName()
    }

    /*
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        //print("top of cancel")
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
*/

    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Resign the text field's first-responder status
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //this method is called after the textFieldShouldReturn method resigns it's first-responder status
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //gets called when user taps image picker's Cancel button
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //gets called when user selects a photo
        
        //The info dictionary contains multiple representations of the images, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        //Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            let ratingProteinX = ratingProtein.ratingProtein
            let ratingMilkX = ratingMilk.ratingMilk
            let ratingGrainX = ratingGrain.ratingGrain
            let ratingVegX = ratingVeg.ratingVeg
            let ratingFruitX = ratingFruit.ratingFruit
            let ratingFatX = ratingFat.ratingFat
            let ratingDessertX = ratingDessert.ratingDessert
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating, ratingProtein: ratingProteinX, ratingMilk: ratingMilkX, ratingGrain: ratingGrainX, ratingVeg: ratingVegX, ratingFruit: ratingFruitX, ratingFat: ratingFatX, ratingDessert: ratingDessertX)
        }
    }
    
    // MARK: Actions
    

    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    /*
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
*/
    
//    @IBAction func setDefaultLabelText(sender: UIButton) {
//    
//        mealNameLabel.text = "Default Text"
//    }

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder() //ensures if user taps image view while typing in the text field, the keyboard is dimissed properly.
        
        //UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        
        //Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        //Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
}

