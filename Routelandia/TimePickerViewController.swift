//
//  TimePickerViewController.swift
//  Routelandia
//
//  Created by Josh Proehl on 3/21/15.
//  Copyright (c) 2015 Routelandia. All rights reserved.
//

import UIKit
import MapKit

class TimePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  
  @IBOutlet weak var dayPicker: UIPickerView!
  @IBOutlet weak var timePicker: UIDatePicker!
  
  
  let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  /** UIPickerView Data Source and Delegates **/
  // returns the number of 'columns' to display.
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // returns the # of rows in each component..
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 7
  }
  
  // Show the value for the requested row
  func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return daysOfWeek[row]
  }
}