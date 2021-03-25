//
//  AccountView.swift
//  Weighted
//
//  Created by Sam Hollingsworth on 2/7/21.
//

import UIKit

final class AccountView: UICollectionViewCell {
    
    struct ViewModel {
        let name: String
        let performance: Double
    }
    
    public static let identifier = "AccountView"
    
    private let stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    private let performanceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        performanceLabel.text = "\(viewModel.performance)"
    }
    
}

// MARK: Private

private extension AccountView {
    
    func setupViews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(performanceLabel)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
