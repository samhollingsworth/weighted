//
//  MainViewController.swift
//  Weighted
//
//  Created by Sam Hollingsworth on 2/7/21.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Weighted"
        return view
    }()
    
    private let accountListView: AccountListView = {
        let view = AccountListView(frame: .zero)
        return view
    }()
    
    private var accounts: [AccountView.ViewModel]?
    
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
        let taxable = AccountView.ViewModel(name: "Taxable", performance: 1.08)
        
        accounts = [rothIRA, retirementPortfolio, taxable]
        
        let collection = AccountListView.ViewModel(
            title: "Individual Accounts",
            portfolios: accounts!)
        accountListView.apply(viewModel: collection)
        accountListView.delegate = self
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(accountListView)
        
        view.addSubview(stackView)
    }
        
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        accountListView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            accountListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            accountListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            accountListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: AccountListViewDelegate

extension MainViewController: AccountListViewDelegate {
    
    func didSelectAccount(at index: Int) {
        print("MainViewController, index: \(index)")
        let selectedAccount = accounts![index]
        print(selectedAccount)
    }
    
}
