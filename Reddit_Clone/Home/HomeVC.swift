//
//  HomeVC.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 15.04.2021.
//

import UIKit

final class HomeVC: UITableViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var items: [HomePresentation] = []
    var vm: HomeVM! {
        didSet{
            vm.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = tableView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        vm.load()
    }
}

extension HomeVC: HomeVMOutputDelegate {
    func updateItems(_ items: [HomePresentation]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    func showAlert(type: NetworkError) {
        switch type {
        case .badURL:
            print("Alert")
        case .decodingError:
            print("Alert")
        case .noData:
            print("Alert")
        }
    }
}

//TableView DataSource & Delegate
extension HomeVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeCell
        let data = items[indexPath.row]
        cell.item = data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

