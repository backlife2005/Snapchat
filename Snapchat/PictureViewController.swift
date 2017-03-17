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
       
        print("\n \n Beginning the process to upload the selected image... \n \n")
        nextButton.isEnabled = false

        print("\n \n The next button has been disabled temporarily... \n \n")
        let imagesFolder = FIRStorage.storage().reference().child("images")

        print("\n \n The selected image will be store into \(imagesFolder) in Firebase Storage... \n \n")
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!

        print("\n \n The image will be save as jpg image at the qaulity ration of 0.1 \n \n")
        let imageFileName = "\(NSUUID().uuidString).jpg"
        imagesFolder.child(imageFileName).put(imageData, metadata: nil, completion: {(metadata, error) in
 
            print("\n \n The image file was given the name of \(imageFileName) \n \n")
            
            if error != nil {
                
                print("We tried to upload! \(error)")
                
            } else {
                
                print("\n \n The image was saved successfuly. \n \n")
                let imageDownloadURL = metadata?.downloadURL()!.absoluteString

                print("\n \n The image \(imageFileName) can be downloaded via the following URL \(imageDownloadURL) \n \n")
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: imageDownloadURL)
                print("\n \n A request has been initiated to perfor a segue to select a user by the \(sender) \n \n")
                
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
        
        let nextVC = segue.destination as! SelecUserViewController
        
        nextVC.snapImageURL = sender as! String
        nextVC.snapImageDescription = descriptionTextField.text!
        
    }
}
