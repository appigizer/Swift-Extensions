//
//  StringExtension.swift
//  PSSwiftExtensions
//
//  Created by Pankaj Sharma on 10/Feb/17.
//  Copyright © 2017 Appigizer. All rights reserved.
//

import UIKit

extension String {
  /// By default it will remove the white spaces
  var length: Int {
    return self.characters.count
  }
  
  var trimmed: String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  var isNotEmpty: Bool {
    return !self.isEmpty
  }
  
  func sizeWithFont(font: UIFont, constrainedToSize: CGSize, lineBreakMode: NSLineBreakMode = NSLineBreakMode.byWordWrapping) -> CGSize {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = lineBreakMode
    
    let textAttributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
    
    let boundingRect = (self as NSString).boundingRect(with: constrainedToSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textAttributes, context: nil)
    
    return boundingRect.size
  }
  
  var fileURL: NSURL {
    return NSURL(fileURLWithPath: self)
  }
  
  var lastPathComponent: String {
    return (self as NSString).lastPathComponent
  }
  
  var deletingLastPathComponent: String {
    return (self as NSString).deletingLastPathComponent
  }
  
  var deletingPathExtension: String {
    return (self as NSString).deletingPathExtension
  }
  
  
  func isValidEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
  }
  
  func isValidMobileNumber() -> Bool {
    do {
      let mobileNumberRegex = try NSRegularExpression(pattern: "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[789]\\d{9}$", options: [])
      return mobileNumberRegex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.length)) != nil
    } catch {
      return false
    }
  }
  
  
  var utf8Encoded: Data? {
    return self.data(using: String.Encoding.utf8, allowLossyConversion: false)
  }
  
  var urlPercentEncoded: String {
    return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
  }
  
  var urlPercentRemoved: String {
    return self.removingPercentEncoding!
  }
  
  
  //============================================================
  //MARK: - Substrings
  func index(from: Int) -> Index {
    return self.index(startIndex, offsetBy: from)
  }
  
  func substring(length: Int) -> String {
    return substring(0, length)
  }
  
  func substring(_ from: Int = 0, _ length: Int? = nil) -> String {
    let fromIndex = index(from: from)
    
    if let validLength = length {
      let endIndex = index(from: from + validLength)
      return substring(with: fromIndex..<endIndex)
    } else {
      return substring(from: fromIndex)
    }
  }
  
  func substring(to: Int) -> String {
    let toIndex = index(from: to)
    return substring(to: toIndex)
  }
  
  
  func substring(with r: Range<Int>) -> String {
    let startIndex = index(from: r.lowerBound)
    let endIndex = index(from: r.upperBound)
    return substring(with: startIndex..<endIndex)
  }
  
  
  public func substring(toString str: String) -> String {
    if let validIndex = self.indexOfSubstring(substr: str) {
      return self.substring(to: validIndex)
    }
    
    return self
  }
  
  
  public func substring(fromString str: String) -> String {
    if let validIndex = self.indexOfSubstring(substr: str) {
      return self.substring(from: self.index(validIndex, offsetBy: str.characters.count))
    }
    
    return self
  }
  
  public func indexOfCharacter(char: Character) -> Int? {
    if let idx = characters.index(of: char) {
      return characters.distance(from: startIndex, to: idx)
    }
    return nil
  }
  
  
  public func indexOfSubstring(substr: String, ignoreCase: Bool = true) -> String.Index? {
    let options: String.CompareOptions = ignoreCase ? .caseInsensitive : [] //[]
    return self.range(of: substr, options: options, range: nil, locale: nil)?.lowerBound
  }

  //============================================================
  //MARK: - Type Conversion
  var doubleValue: Double? {
    return Double(self)
  }  
}
