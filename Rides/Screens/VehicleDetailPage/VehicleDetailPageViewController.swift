//
//  VehicleDetailPageViewController.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit

final class VehicleDetailPageViewController<ViewModel: VehicleDetailPageViewModelable>: UIViewController,
                                                                                        UICollectionViewDelegate,
                                                                                        UICollectionViewDataSource {
    
    var viewModel: VehicleDetailPageViewModelable
    
    private var collectionView: UICollectionView!
    
    init(viewModel: VehicleDetailPageViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: UICollectionViewDataSource

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

// MARK: Private Methods

private extension VehicleDetailPageViewController {
    var layout: UICollectionViewCompositionalLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.showsSeparators = false
        config.backgroundColor = .black
        
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func setup() {
        setupUI()
        setupCollectionView()
    }
    
    func setupUI() {
        view.backgroundColor = .clear
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        
        view.addSubview(collectionView)
        
        collectionView.reloadData()
    }
}
