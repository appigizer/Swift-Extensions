//
//  MiscExtensions.swift
//  PSSwiftExtensions
//
//  Created by Pankaj Sharma on 10/Feb/17.
//  Copyright © 2017 Appigizer. All rights reserved.
//


import CoreLocation


extension CLLocationCoordinate2D {
  
  var latitudeString: String {
    let directionSuffix = self.latitude > 0 ? "N" : "S"
    return self.latitude.toString() + " " + directionSuffix
  }
  
  var longitudeString: String {
    let directionSuffix = self.longitude > 0 ? "E" : "W"
    return self.longitude.toString() + " " + directionSuffix
  }
  
  
  
  func toString(_ separator: String = "\t") -> String {
   return latitudeString + separator + longitudeString
  }

  ///Latitude : max/min +90 to -90
  static func isLatitudeValid(_ value: Double) -> Bool {
    return !(value > 90 || value < -90)
  }
  
  ///Longitude : max/min +180 to -180
  static func isLongitudeValid(_ value: Double) -> Bool {
    return !(value > 180 || value < -180)
  }
}



//===================================================================================================
//MARK: - TimeZone Extension
//===================================================================================================
public extension TimeZone {
  var displayName: String {
    return self.identifier.substring(fromString: "/")
  }
  
  ///Mostly the country name
  var region: String {
    return self.identifier.substring(toString: "/")
  }
  
  var hoursFromGMT: Float {
    let seconds = Float(self.secondsFromGMT())
    return seconds / 3600.0
  }
}


//===================================================================================================
//MARK: - IndexPath
//===================================================================================================
public extension IndexPath {
  public init(_ row: Int, _ section: Int) {
    self.init(row: row, section: section)
  }
}

import CoreGraphics
//===================================================================================================
//MARK: - CGSize & CGRect Extension
//===================================================================================================
public extension CGRect {
  public init(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
    self.init(x: x, y: y, width: width, height: height)
  }
  
  public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
    self.init(x: x, y: y, width: width, height: height)
  }
}


public extension CGSize {
  public init(_ width: Int, _ height: Int) {
    self.init(width: width, height: height)
  }
  
  public init(_ width: CGFloat, _ height: CGFloat) {
    self.init(width: width, height: height)
  }
}


public extension CGPoint {
  public init(_ x: Int, _ y: Int) {
    self.init(x: x, y: y)
  }
  
  public init(_ x: CGFloat, _ y: CGFloat) {
    self.init(x: x, y: y)
  }
}
 
