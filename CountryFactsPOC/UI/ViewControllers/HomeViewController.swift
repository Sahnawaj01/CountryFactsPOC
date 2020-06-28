//
//  HomeViewController.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // Properties
    private var viewModel: FactsViewModel?

    static let cellIdentifier: String = "cell"

    // Initilisation tableview with estamated height for cell
    private var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.estimatedRowHeight = 100
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(HomeTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Facts POC"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupUI()
    }

    // Setting initial setup view which is going to be called when view going to load into memory
    private func setupUI() {
        view.addSubview(tableView) // Adding tableview in controller view
        setupAutoLayout()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        // Add Refresh Control to Table View
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.refreshControl?.tintColor = .black
    }

    private func setupAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func fetchFactsDetials() {
        viewModel = FactsViewModel()
    }

    // MARK: ACTIONS
    @objc private func refreshAction() {

    }
}

// MARK: UITableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.cellIdentifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.setUpCellDetail()
        return cell
    }

}
