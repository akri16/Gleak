//
//  ViewController.swift
//  Gleak
//
//  Created by Swamita Gupta on 22/11/21.
//

import UIKit

class ConnectViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func connectTapped(_ sender: UIButton) {
        if textField.text == "" {
            let alert = UIAlertController(title: "Serial Number is empty!", message: "Type in your serial number to connect.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "connectToHome", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HomeViewController
        destinationVC.serialNumValue = textField.text ?? ""
    }
}

