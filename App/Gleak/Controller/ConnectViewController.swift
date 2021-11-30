//
//  ViewController.swift
//  Gleak
//
//  Created by Swamita Gupta on 22/11/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class ConnectViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        activityIndicator.isHidden = true
    }
    
    @IBAction func connectTapped(_ sender: UIButton) {
        connectButton.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        if textField.text == "" {
            alertMessage(title: "Serial Number is empty!", message: "Type in your serial number to connect.")
            connectButton.isEnabled = true
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        } else {
            if let scode = textField.text {
                checkForSerialNumber(code: scode)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HomeViewController
        if let code = textField.text {
            destinationVC.serialNumValue = code
        }
    }
    
    func checkForSerialNumber(code: String) {
        
        ref.child(code).getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            if !snapshot.exists() {
                self.alertMessage(title: "Oops! Invalid Serial Code", message: "The code you are typing does not exist.")
            } else {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.connectButton.isEnabled = true
                self.performSegue(withIdentifier: "connectToHome", sender: self)
            }
        });
    }
    
    func alertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

