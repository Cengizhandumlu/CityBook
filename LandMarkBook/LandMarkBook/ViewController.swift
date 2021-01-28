//
//  ViewController.swift
//  LandMarkBook
//
//  Created by cengizhan on 13.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        var landmarkNames = [String]()
        var landmarkImages = [UIImage]()
    
        var chosenLandmarkName = ""
        var chosenLandmarkImage=UIImage()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate=self
        tableView.dataSource=self
        
        //LANDMARK BOOK DATA
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Taj mahal")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Great wall")
        landmarkNames.append("Stonehenge")
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        
        navigationItem.title="Landmark Book"
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=landmarkNames[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName=chosenLandmarkName
            destinationVC.selectedLandmarkImage=chosenLandmarkImage
        }
    }


}

