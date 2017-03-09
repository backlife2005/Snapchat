//
//  PictureViewController.swift
//  Snapchat
//
//  Created by Mohammed Al-Khonaizi on 3/8/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

import Firebase

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // imagePicker
    
    var imagePicker = UIImagePickerController ()
    
    
    // @IBOutlet
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    // @IBAction
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        // The following code lines are to required to
        // 1) Sets the source of image (camera, photo library or the saved phote of an album)
        // 2) Stops the editing capability
        // 3) Shows the image picker
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        
        // The following code lines are to required to
        // 1) Disables the Next button until the selected image is upload to the Storage of Firebase
        // 2) Sets the images folder
        // 3) Sets the image data format (PNG or Jpg)
        // 4) Uploads the image to Firebase.
        // 5) Handle error if any. Otherwise, switch to the View Controller which shows the uses 
        
        nextButton.isEnabled = false
        
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImagePNGRepresentation(imageView.image!)!
        
        imagesFolder.child("images.png").put(imageData, metadata: nil, completion: {(metadata, error) in
            
            if error != nil {
                
                print("We tried to upload!r \(error)")
                
            } else {
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
                
            }
        }
            
        )
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Setting the delegate of the imagePicker to self required to work adding the following deleges to VC Class
        // 1) UIImagePickerControllerDelegate 2) UINavigationControllerDelegate)
        
        imagePicker.delegate = self
        
    }
    
    // This function is required to load the image captured by camera into the imageView control.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The following code lines are to required to
        // 1) Sets the value of the image constant to the value of info
        // 2) Set the background of the imageView control to clear
        // 3) Sets the image of imageView control to the value of the constant image
        // 4) Dismiss the image picker
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
}
