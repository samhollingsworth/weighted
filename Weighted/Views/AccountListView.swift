//
//  AccountListView.swift
//  Weighted
//
//  Created by Sam Hollingsworth on 2/7/21.
//

import UIKit

protocol AccountListViewDelegate {
    func didSelectAccount(at index: Int)
}

final class AccountListView: UIView {
    
    var viewModel: AccountListViewModel?
    
    public var delegate: AccountListViewDelegate?
    
    private let stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .green
        view.axis = .vertical
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .red
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.register(AccountView.self, forCellWithReuseIdentifier: AccountView.identifier)
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(viewModel: AccountListViewModel) {
        titleLabel.text = viewModel.title
        self.viewModel = viewModel
        collectionView.reloadData()
    }
    
}

// MARK: Private

private extension AccountListView {
    
    func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(collectionView)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}

// MARK: UICollectionViewDataSource

extension AccountListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccountView.identifier,
            for: indexPath
        ) as! AccountView
        cell.backgroundColor = .orange
        
        guard let something = viewModel?.portfolios[indexPath.row] else {
            fatalError()
        }
        cell.apply(viewModel: something)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.portfolios.count ?? 0
    }
    
}

// MARK: UICollectionViewDelegate

extension AccountListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DID SELECT ITEM at row: \(indexPath.row)")
        delegate?.didSelectAccount(at: indexPath.row)
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension AccountListView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //let width = itemWidth(for: view.frame.width, spacing: 0)

        return CGSize(width: 200, height: 50)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return finalWidth - 5.0
    }
    
}
