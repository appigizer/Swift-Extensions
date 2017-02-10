//
//  HomeViewController.swift
//  PSSwiftExtensionsExample
//
//  Created by Pankaj Sharma on 10/Feb/17.
//  Copyright © 2017 Appigizer. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destVC = segue.destination as? ViewController else { return }
    destVC.isScrollDirectinoVertical = (segue.identifier != "horizontalSegue")
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
