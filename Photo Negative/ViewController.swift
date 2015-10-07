//
//  ViewController.swift
//  Photo Negative
//
//  Created by Farhan on 28/09/2015.
//  Copyright © 2015 Farhan Mannan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
  UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var invertButton: UIButton!
  
  let context = CIContext(options:nil)
  
  let picker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.delegate = self
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
  
  
  @IBAction func photoFromLibrary(sender: UIButton) {
    picker.allowsEditing = false
    picker.sourceType = .PhotoLibrary
    presentViewController(picker, animated: true, completion: nil)
  }
  
  
  func imagePickerController(
    picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String : AnyObject])
  {
    let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage 
    imageView.contentMode = .ScaleAspectFit
    imageView.image = chosenImage
    dismissViewControllerAnimated(true, completion: nil) //5
  }
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func invertBarButtonPressed(sender: UIBarButtonItem) {
    
    let beginImage = CIImage(image: imageView.image!)
    let filter = CIFilter(name: "CIColorInvert")!
    filter.setValue(beginImage, forKey: kCIInputImageKey)
    let filtered = filter.outputImage!
    let bitmap = self.context.createCGImage(filtered, fromRect: filtered.extent)
    imageView.image = UIImage(CGImage: bitmap)
  }
  @IBAction func photoFromLibraryBar(sender: UIBarButtonItem) {
    picker.allowsEditing = false
    picker.sourceType = .PhotoLibrary
//    presentViewController(picker, animated: true, completion: nil)
    picker.modalPresentationStyle = .Popover
    presentViewController(picker,
      animated: true, completion: nil)//4
    picker.popoverPresentationController?.barButtonItem = sender

  }
}

// http://makeapppie.com/2014/12/04/swift-swift-using-the-uiimagepickercontroller-for-a-camera-and-photo-library/

