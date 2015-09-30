//
//  ViewController.swift
//  Photo Negative
//
//  Created by Farhan on 28/09/2015.
//  Copyright © 2015 Farhan Mannan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var invertButton: UIButton!
  let context = CIContext(options:nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func invertButtonPressed(sender: UIButton) {
    
    let beginImage = CIImage(image: imageView.image!)
    let filter = CIFilter(name: "CIColorInvert")!
    filter.setValue(beginImage, forKey: kCIInputImageKey)
    let filtered = filter.outputImage!
    let bitmap = self.context.createCGImage(filtered, fromRect: filtered.extent)
    imageView.image = UIImage(CGImage: bitmap)
  }
}

