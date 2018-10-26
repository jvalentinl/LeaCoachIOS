//
//  RegisterPageViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 10/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextfield: UITextField!
    //@IBOutlet weak var userPasswordTextfield: UITextField!
    @IBOutlet weak var userPasswordTextfield: UITextField!
    @IBOutlet weak var userRepeatPasswordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func userRegisterButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextfield.text
        let userPassword = userPasswordTextfield.text
        let userRepeatPassword = userRepeatPasswordTextfield.text
        //verificar campos vavios
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty ) {
            displayMyAlertMessage(userMessage: "All fields are required")
            return
        }
        
        //ver si password coincide
        if userPassword != userRepeatPassword {
            displayMyAlertMessage(userMessage: "Password don't match")
            return
        }
        
        //data
        UserDefaults.standard.set(userEmail, forKey: value(forKey: "userEmail") as! String)
        UserDefaults.standard.set(userPassword, forKey: value(forKey: "userPassword") as! String)
        UserDefaults.standard.synchronize()
        //mostrar confirmacion
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. thank you!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true, completion: nil)            
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
