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
}
