//
//  ViewController.swift
//  Pick-Photo-from-Photos-Library
//
//  Created by Omid Heydarzadeh on 12/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Define Imageview
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    } ()
    
    // Define Button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.setTitle("Pick Photo", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        return button
    } ()
    
    // Define Label
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.yellow
        label.text = "Pick Photo Project"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.systemBlue
        
        // imageView
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 370,
                                 height: 370)
        imageView.center.x = view.bounds.width / 2
        imageView.center.y = view.bounds.height / 2
        view.addSubview(imageView)
        
        // button
        button.frame = CGRect(x: 0,
                              y: 0,
                              width: 370,
                              height: 100)
        button.center.x = view.bounds.width / 2
        button.center.y = view.bounds.height / 1.2
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: UIControl.Event.touchUpInside)
        
        // label
        label.frame = CGRect(x: 0,
                             y: 0,
                             width: 370,
                             height: 110)
        label.center.x = view.bounds.width / 2
        label.center.y = view.bounds.height / 5.5
        view.addSubview(label)
    }
    
    @objc func didTapButton() {
        let pick = UIImagePickerController()
        pick.sourceType = UIImagePickerController.SourceType.photoLibrary
        pick.delegate = self
        pick.allowsEditing = true
        present(pick, animated: true)
        
    }


}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

//        print("\(info)")
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }


        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

