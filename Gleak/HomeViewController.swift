//
//  HomeViewController.swift
//  Gleaky
//
//  Created by Swamita Gupta on 22/11/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var alerts = ["Save yourself", "Run! Run! Run!"]
    var serialNumValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        serialNumber.text = serialNumValue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func disconnectTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as UITableViewCell
        var content = cell.defaultContentConfiguration()
        var background = UIBackgroundConfiguration.listGroupedCell()
        content.text = alerts[indexPath.row]
        content.textProperties.color = .white
        content.image = UIImage(systemName: "speaker.wave.3.fill")
        content.imageProperties.tintColor = .white
        background.backgroundColor = .clear
        cell.backgroundConfiguration = background
        cell.contentConfiguration = content
        return cell
    }
    
}
