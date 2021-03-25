//
//  MainViewController.swift
//  Weighted
//
//  Created by Sam Hollingsworth on 2/7/21.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let accountListView: AccountListView = {
        let view = AccountListView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

}

// MARK: Private

private extension MainViewController {
    
    func setupViews() {
        let rothIRA = AccountView.ViewModel(name: "Roth IRA", performance: 2.34)
        let retirementPortfolio = AccountView.ViewModel(name: "401k", performance: -0.68)
        
        let collection = AccountListView.ViewModel(
            title: "",
            portfolios: [rothIRA, retirementPortfolio])
        accountListView.apply(viewModel: collection)
        
        view.addSubview(accountListView)
    }
        
    func setupConstraints() {
        accountListView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            accountListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            accountListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            accountListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
