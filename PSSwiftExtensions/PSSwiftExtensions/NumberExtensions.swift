//
//  NumberExtensions.swift
//  PSSwiftExtensions
//
//  Created by Pankaj Sharma on 10/Feb/17.
//  Copyright © 2017 Appigizer. All rights reserved.
//

import Foundation

//MARK: -
extension Double {
  func toString(_ places: Int = 3) -> String {
    return String(format: "%.\(places)f", self)
  }
  
  
  //MARK:- Location related
  ///Latitude : max/min +90 to -90
  var isValidLatitude: Bool {
    return 90 >= self && self >= -90
  }
  
  
  ///Latitude : max/min +180 to -180
  var isValidLongitude: Bool {
    return 180 >= self && self >= -180  
  }
  
  var intValue: Int {
    return Int(self)
  }
  
}

//MARK: -
extension Int {
  var durationString: String {
    let seconds = self
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let second = (seconds % 3600) % 60
    let hoursString: String = {
      let hs = String(hours)
      return hs
    }()
    
    let minutesString: String = {
      var ms = ""
      if  (minutes <= 9 && minutes >= 0) {
        ms = "0\(minutes)"
      } else{
        ms = String(minutes)
      }
      return ms
    }()
    
    let secondsString: String = {
      var ss = ""
      if  (second <= 9 && second >= 0) {
        ss = "0\(second)"
      } else{
        ss = String(second)
      }
      return ss
    }()
    
    var label = ""
    if hours == 0 {
      label =  minutesString + ":" + secondsString
    } else{
      label = hoursString + ":" + minutesString + ":" + secondsString
    }
    return label
  }
}
