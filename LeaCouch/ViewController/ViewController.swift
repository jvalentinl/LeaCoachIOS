//
//  ViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 10/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if !isUserLoggedIn {
            self.performSegue(withIdentifier: "registerView", sender: self)  // FALTA  IMPLEMENTAR
        }
    }
}

