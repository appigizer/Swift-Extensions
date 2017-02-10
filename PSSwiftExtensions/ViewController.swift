//
//  ViewController.swift
//  PSSwiftExtensions
//
//  Created by Pankaj Sharma on 10/Feb/17.
//  Copyright © 2017 Appigizer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Cell: UICollectionViewCell {
  @IBOutlet weak var label: UILabel!
}


class ViewController: UIViewController  {
  
  var isScrollDirectinoVertical = true
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if collectionView != nil {
      (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = isScrollDirectinoVertical ? .vertical : .horizontal
      collectionView.collectionViewLayout.invalidateLayout()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if collectionView != nil {
      collectionView.scrollsToEnd = true
    }
    if tableView != nil {
      tableView.scrollsToEnd = true
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UICollectionViewDataSource
}


//MARK : -
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
    cell.label.text = "\(indexPath)"
    // Configure the cell
    
    return cell
  }
}



//MARK: - 
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
    cell.textLabel?.text = "\(indexPath)"
    // Configure the cell
    return cell
  }
  
}
