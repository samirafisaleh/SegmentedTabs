//
//  MainTabBarController.swift
//  SegmentedTabs
//
//  Created by Sami Saleh on 1/11/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var segmentTabBarView: SegmentTabBarView = {
        let view = SegmentTabBarView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let icons: [String] = [
                                "house.lodge.fill",
                                "house.lodge.fill"
    ]
    
    // This keeps the tab bar from being called multiple times
    private var isInitialized: Bool = false


    /*************************************************************************
     *
     ************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let navc1 = UINavigationController()
        let vc1 = ViewController1()
        navc1.viewControllers.append(vc1)
        
        let navc2 = UINavigationController()
        let vc2 = ViewController2()
        navc2.viewControllers.append(vc2)
        
        self.viewControllers = [navc1, navc2]
        
        // We don't want the tab bar to show
        self.tabBar.isHidden = true
    }
    

    /*************************************************************************
     *
     ************************************************************************/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        InitializeTab()
    }

    
    /*************************************************************************
     *
     ************************************************************************/
    public func InitializeTab() {
        
        // Only continue if this variable is currently false
        guard isInitialized == false else {
            return
        }

        segmentTabBarView.frame = self.tabBar.frame
        segmentTabBarView.delegate = self
        segmentTabBarView.ReplaceSegments(segments: icons)
        segmentTabBarView.SetColor(color: .tintColor)

        segmentTabBarView.SelectIndex(index: 0)
        self.view.addSubview(segmentTabBarView)
        
        isInitialized = true
    }
}

extension MainTabBarController: SegmentTabBarViewDelegate {
    /*************************************************************************
     *
     ************************************************************************/
    @objc func SegmentSelectedIndex(value: Int) {

        self.selectedIndex = value
    }
}
