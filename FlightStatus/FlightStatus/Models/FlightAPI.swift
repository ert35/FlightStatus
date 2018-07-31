//
//  FlightAPI.swift
//  FlightStatus
//
//  Created by Elaina Teramoto on 7/31/18.
//  Copyright © 2018 Elaina Teramoto. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FlightAPI {
    let callID: String
    init(json: JSON) {
        self.callID = json["Call"].stringValue
    }
}
