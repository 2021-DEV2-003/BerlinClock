//
//  ClockViewController.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import UIKit

class ClockViewController: UIViewController {
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var secondsBlockView: UIView!
    @IBOutlet var topHoursBlocks: [UIView]!
    @IBOutlet var bottomHoursBlocks: [UIView]!
    @IBOutlet var topMinutesBlocks: [UIView]!
    @IBOutlet var bottomMinutesBlocks: [UIView]!

    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setUpRoundedCornersForViews()
        setUpBorders()
    }
    
    //MARK: - UI
    private func setUpRoundedCornersForViews() {
        secondsBlockView.layer.cornerRadius = secondsBlockView.bounds.size.width / 2.0
        
        getViewsAndSetUpRoundedCorners(views: topHoursBlocks, lastIndex: "4")
        getViewsAndSetUpRoundedCorners(views: bottomHoursBlocks, lastIndex: "4")
        getViewsAndSetUpRoundedCorners(views: topMinutesBlocks, lastIndex: "11")
        getViewsAndSetUpRoundedCorners(views: bottomMinutesBlocks, lastIndex: "4")
    }
    
    private func getViewsAndSetUpRoundedCorners(views: [UIView], lastIndex: String) {
        let firstViewBlock = views.first { $0.accessibilityIdentifier == "1" }
        firstViewBlock?.layer.cornerRadius = 10
        firstViewBlock?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        let lastViewBlock = views.first { $0.accessibilityIdentifier == lastIndex }
        lastViewBlock?.layer.cornerRadius = 10
        lastViewBlock?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setUpBorders() {
        secondsBlockView.layer.borderWidth = 2.0
        secondsBlockView.layer.borderColor = UIColor.black.cgColor
        
        topHoursBlocks.forEach { (topHourBlock) in
            topHourBlock.layer.borderWidth = 2.0
            topHourBlock.layer.borderColor = UIColor.black.cgColor
        }
        
        bottomHoursBlocks.forEach { (bottomHourBlock) in
            bottomHourBlock.layer.borderWidth = 2.0
            bottomHourBlock.layer.borderColor = UIColor.black.cgColor
        }
        
        topMinutesBlocks.forEach { (topMinuteBlock) in
            topMinuteBlock.layer.borderWidth = 2.0
            topMinuteBlock.layer.borderColor = UIColor.black.cgColor
        }
        
        bottomMinutesBlocks.forEach { (bottomMinuteBlock) in
            bottomMinuteBlock.layer.borderWidth = 2.0
            bottomMinuteBlock.layer.borderColor = UIColor.black.cgColor
        }
    }
}
