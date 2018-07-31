//
//  FlightInputViewController.swift
//  FlightStatus
//
//  Created by Elaina Teramoto on 7/30/18.
//  Copyright © 2018 Elaina Teramoto. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
//import AlamofireNetworkActivityIndicator


class FlightInputViewController: UIViewController{
    var callString: String = ""
    var airlineString: String = ""
    var flightString: String = ""
    var isFound = false
    @IBOutlet weak var airlineTextField: UITextField!
    
    @IBAction func editAirlineTextField(_ sender: Any) {
        airlineString = airlineTextField.text!
        print(airlineString)
    }
    @IBOutlet weak var flightIdTextField: UITextField!
    
    @IBAction func editFlightIDTextField(_ sender: Any) {
        flightString = flightIdTextField.text!
        print(flightString)
    }
    @IBOutlet weak var startAirportTextField: UITextField!
    @IBOutlet weak var endAirportTextField: UITextField!
//    @IBOutlet weak var dateTextField: UITextField!
//    @IBOutlet weak var amPmTextField: UITextField!
//    @IBOutlet weak var timeTextField: UITextField!
//    @IBOutlet weak var timezoneTextField: UITextField!
    
    func checkIfEqual(findingString: String, chosenAircraft: FlightAPI){
        // chekc if they equal
        if (chosenAircraft.callID == findingString){
            isFound = true
        }
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        callString = airlineString + flightString
        print(callString)
        var FlightInput = Flight(callID: callString)
        print(FlightInput.callID)
        let apiToContact = "http://public-api.adsbexchange.com/VirtualRadar/AircraftList.json"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let jsonCreated = JSON(value)
                    let allFlightQuery = jsonCreated["acList"].arrayValue
                    
                    for i in 0..<allFlightQuery.count{
                        if (self.isFound == false){
                            self.checkIfEqual(findingString: self.callString, chosenAircraft: FlightAPI(json: allFlightQuery[i]))
                        }
                        else{
                            break;
                        }
                    }
                    if (self.isFound == true){
                        print("it has been found!!")
                    }else{
                        print("it has not been found")
                    }
                    //let allFlightQuery = jsonCreated["fCallQ"][self.callString].arrayValue
                    //print(allFlightQuery)
//                    self.parseMovieLabel(chosenMovie: Movie(json: allMoviesData[chooseRandom]) )
                    
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
    
    
//    @IBAction func changeDateTapped(_ sender: Any) {
//        print("edit Date text field was pressed")
//        let datePickerView:UIDatePicker = UIDatePicker()
//        datePickerView.datePickerMode = UIDatePickerMode.date
//        dateTextField.inputView = datePickerView
//        datePickerView.addTarget(self, action: Selector(("handleDatePicker:")), for: UIControlEvents.valueChanged)
//    }
//
//    func datePickerValueChanged(sender:UIDatePicker) {
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        dateTextField.text = dateFormatter.string(from: sender.date)
//    }
//
    
    override func viewDidLoad() {
        print("This is the flight view controller")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
