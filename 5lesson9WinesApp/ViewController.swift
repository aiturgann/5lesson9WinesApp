//
//  ViewController.swift
//  5lesson9WinesApp
//
//  Created by Aiturgan Kurmanbekova on 8/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    let wineService = WineService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wineService.getWines()
    }


}

