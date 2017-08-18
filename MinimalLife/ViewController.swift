//
//  ViewController.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/16/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var activityPicker: UIPickerView!
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet var tappedOutsideTextField: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPicker.delegate = self
        activityPicker.dataSource = self
        activityTextField.delegate = self
        tappedOutsideTextField.delegate = self
    }

/*********************************************************************/
/*                      Activity TextField Functions                 */
/*********************************************************************/
    // create a function to load the suggestions from the database
    private var previousEntries: [String] = ["111", "222", "333"]
    private var filteredEntries: [String] = []
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filteredEntries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filteredEntries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (activityTextField.isEditing) {
            activityTextField.text = filteredEntries[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // show the picker and bring activity textfield to front if textfield is selected
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activityPicker.isHidden = false
        overlayView.bringSubview(toFront: activityView)
    }
    
    // hide the picker and bring the quote view to front if activity textfield is dismissed
    func textFieldDidEndEditing(_ textField: UITextField) {
        activityPicker.isHidden = true
        activityTextField.text = ""
        overlayView.bringSubview(toFront: quoteView)
    }
    
    // dismiss activity textfield upon return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       return activityTextField.endEditing(true)
    }
    
    // dismiss the activity textfield if user taps outside of both
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let inTextField = activityTextField.frame.contains(touch.preciseLocation(in: overlayView))
        let inPicker = activityPicker.frame.contains(touch.preciseLocation(in: overlayView))
        if (activityTextField.isEditing && !(inTextField || inPicker)) {
            activityTextField.endEditing(true)
            return false
        }
        return true
    }
    
/*********************************************************************/
/*                      Quote Flasher Functions                      */
/*********************************************************************/
    
    
}

