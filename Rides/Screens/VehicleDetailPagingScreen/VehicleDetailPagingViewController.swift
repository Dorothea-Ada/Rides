//
//  VehicleDetailPagingViewController.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import UIKit
import SwiftUI

final class VehicleDetailPagingViewController: UIPageViewController,
                                               UIPageViewControllerDataSource,
                                               UIPageViewControllerDelegate {

    private var pages = [UIViewController]()
    private let pageControl = UIPageControl()
    
    private let initialPage: Int = 0
    
    var viewModel: VehicleDetailPagingViewModelable
    
    init(viewModel: VehicleDetailPagingViewModelable) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        let page1 = VehicleDetailPageViewController<VehicleBasicInfoViewModel>(
            viewModel: VehicleBasicInfoViewModel(vehicle: viewModel.vehicle)
        )
        let page2 = VehicleDetailPageViewController<VehicleEmissionsViewModel>(
            viewModel: VehicleEmissionsViewModel(vehicle: viewModel.vehicle)
        )
        
        pages.append(page1)
        pages.append(page2)
        
        setViewControllers(
            [pages[initialPage]],
            direction: .forward,
            animated: true,
            completion: nil
        )
        
        setupPageControl()
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                return self.pages.last
            } else {
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex < pages.count - 1 {
                return pages[viewControllerIndex + 1]
            } else {
                return pages.first
            }
        }
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = pages.firstIndex(of: viewControllers[0]) {
                pageControl.currentPage = viewControllerIndex
            }
        }
    }
}

// MARK: Private Methods

private extension VehicleDetailPagingViewController {
    func setupPageControl() {
        pageControl.frame = CGRect()
        pageControl.currentPageIndicatorTintColor = Color.customRed.uiColor
        pageControl.pageIndicatorTintColor = Color.customGrayDarkest.uiColor
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        view.addSubview(self.pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
        pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
