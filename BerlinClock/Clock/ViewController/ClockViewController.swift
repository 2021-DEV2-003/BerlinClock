//
//  ClockViewController.swift
//  BerlinClock
//
//  Created by Ananth Bhamidipati on 06/02/2021.
//

import UIKit

final class ClockViewController: UIViewController {
    
    private let viewModel: ClockViewModel
    
    private var timer: DispatchSourceTimer?
    
    // MARK: - Init
    
    init(viewModel: ClockViewModel) {
        self.viewModel = viewModel
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
    @IBOutlet weak var digitalTimeLabel: UILabel!
    
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTimeAndUpdateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.cancel()
        timer = nil
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpRoundedCornersForViews()
        setUpBorders()
    }
    
    // MARK: - Time
    
    private func getTimeAndUpdateUI() {
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now(), repeating: .seconds(1), leeway: .seconds(0))
        timer?.setEventHandler(handler: { [weak self] in
            guard let strongSelf = self else { return }
            let time = strongSelf.getHoursMinutesSeconds()
            let code = strongSelf.viewModel.getBerlinTimeCode(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
            let colors = strongSelf.viewModel.getBerlinTimeColors(code: code)
            let digitalTime = strongSelf.viewModel.getDigitalTimeFromCode(code: code)
            DispatchQueue.main.async {
                strongSelf.updateClockUI(secondsColor: colors.secondsColor, topHours: colors.topHours, bottomHours: colors.bottomHours, topMinutes: colors.topMinutes, bottomMinutes: colors.bottomMinutes)
                strongSelf.updateTimeLabel(timeText: digitalTime)
            }
        })
        timer?.resume()
    }
    
    private func getHoursMinutesSeconds() -> (hours: Int, minutes: Int, seconds: Int) {
        let date = Date()
        var calendar = Calendar.current
        if let timeZone = TimeZone(identifier: "CET") {
            calendar.timeZone = timeZone
        }
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        return (hours, minutes, seconds)
    }
    
    // MARK: - Clock UI
    
    private func updateClockUI(secondsColor: UIColor, topHours: [UIColor], bottomHours: [UIColor], topMinutes: [UIColor], bottomMinutes: [UIColor]) {
        secondsBlockView.backgroundColor = secondsColor
        
        topHoursBlocks.enumerated().forEach { (index, topHourBlock) in
            if topHourBlock.accessibilityIdentifier == String(index + 1) {
                let color = topHours[safe: index]
                topHourBlock.backgroundColor = color
            }
        }
        
        bottomHoursBlocks.enumerated().forEach { (index, bottomHoursBlock) in
            if bottomHoursBlock.accessibilityIdentifier == String(index + 1) {
                let color = bottomHours[safe: index]
                bottomHoursBlock.backgroundColor = color
            }
        }
        
        topMinutesBlocks.enumerated().forEach { (index, topMinutesBlock) in
            if topMinutesBlock.accessibilityIdentifier == String(index + 1) {
                let color = topMinutes[safe: index]
                topMinutesBlock.backgroundColor = color
            }
        }
        
        bottomMinutesBlocks.enumerated().forEach { (index, bottomMinutesBlock) in
            if bottomMinutesBlock.accessibilityIdentifier == String(index + 1) {
                let color = bottomMinutes[safe: index]
                bottomMinutesBlock.backgroundColor = color
            }
        }
    }
    
    private func updateTimeLabel(timeText: String) {
        digitalTimeLabel.text = timeText
    }
    
    
    // MARK: - UI
    
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
    
    private func setupUI() {
        self.navigationItem.title = "Berlin Clock"
    }
}
