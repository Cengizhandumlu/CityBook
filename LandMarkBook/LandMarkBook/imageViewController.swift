//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by cengizhan on 13.01.2021.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLabel.text=selectedLandmarkName
        imageView.image=selectedLandmarkImage
        
    }
    


}
