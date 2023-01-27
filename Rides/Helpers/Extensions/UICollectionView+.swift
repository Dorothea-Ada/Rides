//
//  UICollectionView+.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cells: T.Type...) {
        cells.forEach { cell in
            let cellNib = UINib(nibName: T.reuseIdentifier, bundle: nil)
            register(cellNib, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
