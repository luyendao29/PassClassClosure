//
//  ViewController.swift
//  PassClosureTableView
//
//  Created by Boss on 5/12/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit
typealias closure = ((_ data: Peron?) -> Void)
class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var textFieldname: UITextField!
    
    @IBOutlet weak var textFieldage: UITextField!
    var myClosure: closure?
    var perSon: Peron?
    //var callBack: ((String?,String?, UIImage?) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if perSon != nil{
            images.image = perSon?.image
            textFieldname.text = perSon?.name
            textFieldage.text = perSon?.age
        }
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        images.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    @IBAction func PassData(_ sender: Any) {
       let data = Peron(image: images.image!, name: textFieldname.text!, age: textFieldage.text!)
        myClosure!(data)
        //callBack?(textFieldname.text,textFieldage.text,images.image)
        navigationController?.popViewController(animated: true)
    }
    
    
}

