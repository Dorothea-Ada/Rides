//
//  DetailCell.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit
import SwiftUI

final class DetailCell: UICollectionViewCell {

    var onDropdownPressed: (() -> Void)?

    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

// MARK: Configurable

extension DetailCell: Configurable {
    func configure(for viewModel: DetailCellViewModel) {
        titleLabel.text = viewModel.carInfo.rawValue
        valueLabel.text = viewModel.value
    }
}

// MARK: Private Methods

private extension DetailCell {
    func setupUI() {
        backgroundColor = Color.customGrayDarkest.uiColor
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.regular18
        
        valueLabel.textColor = Color.customGrayLight.uiColor
        valueLabel.font = UIFont.regular24
    }
}
