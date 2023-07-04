//
//  ViewController.swift
//  Youtube-Api
//
//  Created by Fa Ainama Caldera S on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // variabel untuk memanggil file untuk ditampilkan di ViewController
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

