//
//  VehicleDetailViewController.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit

final class VehicleDetailViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var viewModel: VehicleDetailViewModelable!

    init?(coder: NSCoder, viewModel: VehicleDetailViewModelable) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setup()
    }
}

// MARK: Private Methods

private extension VehicleDetailViewController {
    func setup() {
        setupUI()
        setupCollectionView()
    }
    
    func setupUI() {
        view.backgroundColor = .clear
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.showsSeparators = false
        config.backgroundColor = .black
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource

extension VehicleDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModel.dataSource[indexPath.row]
        
        switch viewModel {
        case .detail(let detailViewModel):
            let cell: DetailCell = collectionView.dequeue(for: indexPath)
            return cell.configured(for: detailViewModel)
        }
    }
}

// MARK: UICollectionViewDelegate

extension VehicleDetailViewController: UICollectionViewDelegate { }
