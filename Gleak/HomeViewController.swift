//
//  HomeViewController.swift
//  Gleaky
//
//  Created by Swamita Gupta on 22/11/21.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftyJSON

class HomeViewController: UIViewController {
    
    @IBOutlet weak var initView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var refObservers: [DatabaseHandle] = []
    var notifs : [Notification] = []
    
    var serialNumValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        serialNumber.text = serialNumValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initView.isHidden = false
        activityIndicator.startAnimating()
        
        let ref = Database.database().reference(withPath: serialNumValue)
        let completed = ref.observe(.value) { snapshot in
            
            self.notifs = []
            
            if let svalue = snapshot.value as? [String: Any] {
                let value = svalue["value"] as? Int ?? 0
                self.valueLabel.text = String(value)
                let isAlerting = svalue["isAlerting"] as? Bool ?? false
                if isAlerting {
                    self.view.backgroundColor = .red
                } else {
                    self.view.backgroundColor = UIColor(named: "darkGreen")
                }
                let notifications = svalue["notifications"] as! [String: [String: Any]]
                
                for child in notifications {
                    let notif = child.value
                    let message = notif["body"] as? String ?? ""
                    let time = notif["time"] as? Int ?? 0
                    let title = notif["title"] as? String ?? ""
                    let notification = Notification(title: title, message: message, time: time)
                    self.notifs.append(notification)
                    
                }
            }
            
            
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.initView.isHidden = true
        }
        refObservers.append(completed)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let ref = Database.database().reference(withPath: serialNumValue)
        refObservers.forEach(ref.removeObserver(withHandle:))
        refObservers = []
    }
    
    @IBAction func disconnectTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as UITableViewCell
        var content = cell.defaultContentConfiguration()
        var background = UIBackgroundConfiguration.listGroupedCell()
        content.text = "\(notifs[indexPath.row].title)\n\(notifs[indexPath.row].message)\n\(notifs[indexPath.row].toTime())"
        
        content.textProperties.color = .white
        content.image = UIImage(systemName: "speaker.wave.3.fill")
        content.imageProperties.tintColor = .white
        background.backgroundColor = .clear
        cell.backgroundConfiguration = background
        cell.contentConfiguration = content
        return cell
    }
    
}
