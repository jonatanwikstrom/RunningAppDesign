//
//  ViewController.swift
//  RunningAppDesign
//
//  Created by Jonatan Wikström on 2021-06-14.
//

import SwiftUI
import MapKit


class firstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func loginEmailTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "second_vc") as! secondViewController
        present(vc, animated: true)
    }
    
    
    @IBAction func noAccLoginTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "second_vc") as! secondViewController
        present(vc, animated: true)
        
        
    }
    

}

