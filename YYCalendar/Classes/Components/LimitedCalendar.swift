//
//  LimitedCalendar.swift
//  Pods
//
//  Created by DevYeom on 31/07/2019.
//

import UIKit

@available(iOS 10.0, *)
@objcMembers open class LimitedCalendar: UIViewController {

    // MARK: - UI Properties

    var backgroundView: UIView!
    var contentView: UIView!
    var headerView: UIView!
    var bodyView: UIView!
    var lineSeparatorView: UIView!
    var yearLabel: UILabel!
    var monthLabel: UILabel!
    var closeButton: UIButton!
    var yearLeftButton: UIButton!
    var yearRightButton: UIButton!
    var monthLeftButton: UIButton!
    var monthRightButton: UIButton!
    var selectMonthYearStackView: UIStackView!
    var weekStackView: UIStackView!
    var dayStackView: UIStackView!
    private var contentViewWidthByViewWidthConstarint: NSLayoutConstraint!
    private var contentViewWidthByViewHeightConstarint: NSLayoutConstraint!

    // MARK: - Calendar Style

    var dayButtonStyle: DayButtonStyle = .roundishSquare
    var hideDuration: Double = 0.3
    var dimmedBackgroundColor: UIColor = UIColor.black
    var dimmedBackgroundAlpha: CGFloat = 0.5
    var headerViewBackgroundColor: UIColor = Useful.getUIColor(245, 245, 245)
    var bodyViewBackgroundColor: UIColor = Useful.getUIColor(255, 255, 255)
    var sundayColor: UIColor = Useful.getUIColor(235, 61, 79)
    var disabledSundayColor: UIColor = Useful.getUIColor(251, 197, 202)
    var saturdayColor: UIColor = Useful.getUIColor(53, 113, 214)
    var disabledSaturdayColor: UIColor = Useful.getUIColor(194, 212, 243)
    var defaultDayColor: UIColor = Useful.getUIColor(51, 51, 51)
    var disabledDefaultDayColor: UIColor = Useful.getUIColor(193, 193, 193)
    var lineSeparatorColor: UIColor = Useful.getUIColor(233, 233, 233)
    var selectedDayColor: UIColor = Useful.getUIColor(55, 137, 220)
    var headerLabelFont: UIFont = UIFont.systemFont(ofSize: 24)
    var weekLabelFont: UIFont = UIFont.systemFont(ofSize: 16)
    var dayLabelFont: UIFont = UIFont.systemFont(ofSize: 19)

    var dayArray: [String] = []
    var dayButtonArray: [DayButton] = []
    var dayStackViewArray: [UIStackView] = []

    var tapOutsideTouchGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()

    public var allowTouchOutsideToDismiss: Bool = true {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                if allowTouchOutsideToDismiss == true {
                    weakSelf.tapOutsideTouchGestureRecognizer.addTarget(weakSelf, action: #selector(dismissView))
                } else {
                    weakSelf.tapOutsideTouchGestureRecognizer.removeTarget(weakSelf, action: #selector(dismissView))
                }
            }
        }
    }

    // MARK: - Data Properties

    public var selectHandler: SelectHandler?
    public var inquiryDate: Date = Date() // input date from client
    public var dateFormat: String = "" // input date format from client
    public var langType: LangType = .ENG // default value is English
    let calendar: Calendar = Calendar(identifier: .gregorian)
    var weekArray: [String] = []

    // Detached from inquiryDate
    var inputYear: Int = 0
    var inputMonth: Int = 0
    var inputDay: Int = 0
    var lastDay: Int = 0

    // In order to draw calendar
    var firstWeekDay: Int = 0
    var lastWeekDay: Int = 0
    var isTodayMonth: Bool = false
    var isdisabledMonth: Bool = false
    var todayYear: Int = Calendar.current.component(.year, from: Date())
    var todayMonth: Int = Calendar.current.component(.month, from: Date())
    var todayDay: Int = Calendar.current.component(.day, from: Date())
    var minDate: Date = Date(timeIntervalSince1970: 0) // limited minimum date
    var maxDate: Date = Date() // limited maximum date

    // MARK: - Initialization

    public init(langType type: LangType, date: String, minDate: String?, maxDate: String?, format: String, completion selectHandler: @escaping SelectHandler) {
        super.init(nibName: nil, bundle: nil)
        self.langType = type
        self.dateFormat = format
        self.inquiryDate = Useful.stringToDate(date, format: self.dateFormat) ?? Date()
        self.selectHandler = selectHandler

        self.setupLangType()
        self.setupDate()

        // minDate default: 01/01/1900, maxDate default: today
        var component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        component.year = 1900
        component.month = 1
        component.day = 1
        self.minDate = Useful.stringToDate(minDate ?? "", format: self.dateFormat) ?? Calendar.current.date(from: component)!
        self.maxDate = Useful.stringToDate(maxDate ?? "", format: self.dateFormat) ?? Date()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // Cannot use when windows is nil
    func windowNotReady() -> Bool {
        if UIApplication.shared.windows.isEmpty {
            #if DEBUG
            print("📆 YYCalendar Error ::: It can't initialize calendar. Because the application has no window.")
            #endif
        }
        return UIApplication.shared.windows.isEmpty
    }

    // MARK: - Setup

    // Week label can be changed by selecting langType
    func setupLangType() {
        self.weekArray = self.langType.week
    }

    // Set date componet by detaching from inquiryDate
    func setupDate() {
        self.inputYear = self.calendar.component(.year, from: self.inquiryDate)
        self.inputMonth = self.calendar.component(.month, from: self.inquiryDate)
        self.inputDay = self.calendar.component(.day, from: self.inquiryDate)
        self.lastDay = self.calendar.component(.day, from: self.inquiryDate.endOfMonth())
        self.firstWeekDay = self.calendar.component(.weekday, from: self.inquiryDate.startOfMonth())
        self.lastWeekDay = self.calendar.component(.weekday, from: self.inquiryDate.endOfMonth())

        // Do inputMonth include today?
        if self.todayMonth == self.inputMonth && self.todayYear == self.inputYear {
            self.isTodayMonth = true
        } else {
            self.isTodayMonth = false
        }

        // Is this month after todayMonth?
        if self.todayYear < self.inputYear {
            self.isdisabledMonth = true
        } else {
            if self.todayMonth < self.inputMonth && self.todayYear == self.inputYear {
                self.isdisabledMonth = true
            } else {
                self.isdisabledMonth = false
            }
        }
    }

    func setupViews() {
        if windowNotReady() {
            return
        }

        self.view = UIView(frame: (UIApplication.shared.keyWindow?.bounds)!)

        // Setup Gesture
        if allowTouchOutsideToDismiss == true {
            self.tapOutsideTouchGestureRecognizer.addTarget(self, action: #selector(dismissView))
        }

        // Setup Background
        self.backgroundView = UIView.init()
        self.backgroundView.addGestureRecognizer(self.tapOutsideTouchGestureRecognizer)
        self.backgroundView.backgroundColor = self.dimmedBackgroundColor
        self.backgroundView.alpha = self.dimmedBackgroundAlpha
        self.view.addSubview(self.backgroundView)

        // Setup ContentView
        self.contentView = UIView.init()
        self.contentView.backgroundColor = UIColor.white
        self.contentView.clipsToBounds = true
        self.view.addSubview(self.contentView)

        // Setup HeaderView
        self.headerView = UIView.init()
        self.headerView.backgroundColor = self.headerViewBackgroundColor
        self.headerView.clipsToBounds = true
        self.contentView.addSubview(self.headerView)

        // Setup lineSeparatorView
        self.lineSeparatorView = UIView.init()
        self.lineSeparatorView.backgroundColor = self.lineSeparatorColor
        self.contentView.addSubview(self.lineSeparatorView)

        // Setup BodyView
        self.bodyView = UIView.init()
        self.bodyView.backgroundColor = self.bodyViewBackgroundColor
        self.bodyView.clipsToBounds = true
        self.contentView.addSubview(self.bodyView)

        // Setup CloseButton
        self.closeButton = UIButton.init(type: .custom)
        self.closeButton.setBackgroundImage(Image.close, for: .normal)
        self.closeButton.setBackgroundImage(Image.highlightedClose, for: .highlighted)
        self.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.headerView.addSubview(self.closeButton)

        // Setup Month, Year Label
        self.monthLabel = UILabel.init()
        self.yearLabel = UILabel.init()
        self.monthLabel.text = String(format: "%02d월", self.inputMonth)
        self.monthLabel.font = self.headerLabelFont
        self.yearLabel.text = String(format: "%d년", self.inputYear)
        self.yearLabel.font = self.headerLabelFont

        // Setup Month, Year Select Button
        self.yearLeftButton = UIButton.init(type: .custom)
        self.yearRightButton = UIButton.init(type: .custom)
        self.monthLeftButton = UIButton.init(type: .custom)
        self.monthRightButton = UIButton.init(type: .custom)
        self.yearLeftButton.setImage(Image.leftArrow, for: .normal)
        self.yearLeftButton.setImage(Image.highlightedLeftArrow, for: .highlighted)
        self.yearRightButton.setImage(Image.rightArrow, for: .normal)
        self.yearRightButton.setImage(Image.highlightedRightArrow, for: .highlighted)
        self.monthLeftButton.setImage(Image.leftArrow, for: .normal)
        self.monthLeftButton.setImage(Image.highlightedLeftArrow, for: .highlighted)
        self.monthRightButton.setImage(Image.rightArrow, for: .normal)
        self.monthRightButton.setImage(Image.highlightedRightArrow, for: .highlighted)
        self.yearLeftButton.restorationIdentifier = "previousYear"
        self.yearRightButton.restorationIdentifier = "nextYear"
        self.monthLeftButton.restorationIdentifier = "previousMonth"
        self.monthRightButton.restorationIdentifier = "nextMonth"
        self.yearLeftButton.addTarget(self, action: #selector(changeMonthOrYear(_:)), for: .touchUpInside)
        self.yearRightButton.addTarget(self, action: #selector(changeMonthOrYear(_:)), for: .touchUpInside)
        self.monthLeftButton.addTarget(self, action: #selector(changeMonthOrYear(_:)), for: .touchUpInside)
        self.monthRightButton.addTarget(self, action: #selector(changeMonthOrYear(_:)), for: .touchUpInside)

        // Setup SelectMonthYear StackView
        self.selectMonthYearStackView = UIStackView.init()
        self.selectMonthYearStackView.axis = .horizontal
        self.selectMonthYearStackView.spacing = 2
        self.selectMonthYearStackView.addArrangedSubview(self.yearLeftButton)
        self.selectMonthYearStackView.addArrangedSubview(self.yearLabel)
        self.selectMonthYearStackView.addArrangedSubview(self.yearRightButton)
        self.selectMonthYearStackView.addArrangedSubview(self.monthLeftButton)
        self.selectMonthYearStackView.addArrangedSubview(self.monthLabel)
        self.selectMonthYearStackView.addArrangedSubview(self.monthRightButton)
        self.headerView.addSubview(self.selectMonthYearStackView)

        // Setup Week StackView
        self.weekStackView = UIStackView.init()
        self.weekStackView.axis = .horizontal
        self.weekStackView.spacing = 0
        self.weekStackView.distribution = .fillEqually

        for index in 0..<7 {
            let tempLabel = UILabel.init()
            tempLabel.textAlignment = .center
            tempLabel.font = self.weekLabelFont
            tempLabel.textColor = self.defaultDayColor
            tempLabel.text = self.weekArray[index]

            if index == 0 {
                tempLabel.textColor = self.sundayColor
            } else if index == 6 {
                tempLabel.textColor = self.saturdayColor
            }

            self.weekStackView.addArrangedSubview(tempLabel)
        }

        self.headerView.addSubview(self.weekStackView)

        // Setup Day
        self.dayStackView = UIStackView.init()
        self.dayStackView.axis = .vertical
        self.dayStackView.spacing = 0
        self.dayStackView.distribution = .fillEqually

        for row in 1...6 {
            let tempStackView = UIStackView.init()
            tempStackView.axis = .horizontal
            tempStackView.spacing = 0
            tempStackView.distribution = .fillEqually

            for column in 1...7 {
                let tempButton = DayButton(style: dayButtonStyle)
                tempButton.translatesAutoresizingMaskIntoConstraints = false
                tempButton.heightAnchor.constraint(equalTo: tempButton.widthAnchor).isActive = true
                tempButton.titleLabel?.font = self.dayLabelFont
                tempButton.selectedDayColor = self.selectedDayColor

                if column == 1 { // Sunday
                    tempButton.setTitleColor(self.sundayColor, for: .normal)
                } else if column == 7 { // Saturday
                    tempButton.setTitleColor(self.saturdayColor, for: .normal)
                } else { // Weekday
                    tempButton.setTitleColor(self.defaultDayColor, for: .normal)
                }

                tempButton.setTitle("", for: .normal)
                tempButton.tag = row * 10 + column
                tempButton.addTarget(self, action: #selector(selectDayButton(_:)), for: .touchUpInside)

                tempStackView.addArrangedSubview(tempButton)
            }

            self.dayStackView.addArrangedSubview(tempStackView)
        }

        self.bodyView.addSubview(self.dayStackView)
    }

    func setupAutoLayout() {
        // Use Autolayout
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.lineSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        self.bodyView.translatesAutoresizingMaskIntoConstraints = false
        self.monthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.yearLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weekStackView.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.monthLeftButton.translatesAutoresizingMaskIntoConstraints = false
        self.monthRightButton.translatesAutoresizingMaskIntoConstraints = false
        self.yearLeftButton.translatesAutoresizingMaskIntoConstraints = false
        self.yearRightButton.translatesAutoresizingMaskIntoConstraints = false
        self.selectMonthYearStackView.translatesAutoresizingMaskIntoConstraints = false
        self.dayStackView.translatesAutoresizingMaskIntoConstraints = false

        // BackgroundView
        self.backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        // ContentView
        self.contentViewWidthByViewWidthConstarint = self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.82)
        self.contentViewWidthByViewHeightConstarint = self.contentView.widthAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.82)
        self.contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        setLandscapeMode(UIDevice.current.orientation.isLandscape)

        // HeaderView
        self.headerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.headerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.headerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

        // LineSeparatorView
        self.lineSeparatorView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor).isActive = true
        self.lineSeparatorView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor).isActive = true
        self.lineSeparatorView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor).isActive = true
        self.lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        // BodyView
        self.bodyView.topAnchor.constraint(equalTo: self.lineSeparatorView.bottomAnchor).isActive = true
        self.bodyView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.bodyView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.bodyView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true

        // Close Button
        self.closeButton.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 3).isActive = true
        self.closeButton.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -3).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.closeButton.widthAnchor.constraint(equalTo: self.closeButton.heightAnchor).isActive = true

        // SelectMonthYear StackView
        self.selectMonthYearStackView.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 20).isActive = true
        self.selectMonthYearStackView.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor).isActive = true
        self.selectMonthYearStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // Week StackView
        self.weekStackView.topAnchor.constraint(equalTo: self.selectMonthYearStackView.bottomAnchor).isActive = true
        self.weekStackView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 11).isActive = true
        self.weekStackView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -11).isActive = true
        self.weekStackView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor).isActive = true
        self.weekStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true

        // Day StackView
        self.dayStackView.topAnchor.constraint(equalTo: self.weekStackView.bottomAnchor, constant: 6).isActive = true
        self.dayStackView.leadingAnchor.constraint(equalTo: self.bodyView.leadingAnchor, constant: 11).isActive = true
        self.dayStackView.trailingAnchor.constraint(equalTo: self.bodyView.trailingAnchor, constant: -11).isActive = true
        self.dayStackView.bottomAnchor.constraint(equalTo: self.bodyView.bottomAnchor, constant: -14).isActive = true
    }

    func setupCalendar() {
        setLabel() // set year and month label
        setDayArray() // set day to dayArray from 1 to lastDay(28, 30, 31) of this month

        // Setup DayButton
        for case let verticalStackView as UIStackView in self.bodyView.subviews {
            for case let horizontalStackView as UIStackView in verticalStackView.subviews {
                for case let button as DayButton in horizontalStackView.subviews {
                    let row = button.tag / 10
                    let weekDay = button.tag % 10
                    let day = self.dayArray.first

                    setTodayIcon(button: button, day: day) // mark today icon (blue dot)

                    if let day = Int(day ?? "1") {
                        // temporary variables to compare date
                        var dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self.inquiryDate)
                        dateComponent.day = day
                        let tempDate = Calendar.current.date(from: dateComponent)!

                        // available to select date between minDate and maxDate
                        if self.minDate <= tempDate && tempDate <= self.maxDate {
                            setDayButtonStyle(button: button, weekDay: weekDay, enabled: true)
                        } else {
                            setDayButtonStyle(button: button, weekDay: weekDay, enabled: false)
                        }
                    }

                    if row == 1 {
                        if weekDay < self.firstWeekDay { // befroe 1st day in first week
                            button.setTitle("", for: .normal)
                            button.isEnabled = false
                        } else {
                            button.setTitle(day, for: .normal)

                            self.dayArray.removeFirst()
                        }
                    } else {
                        if day != nil {
                            button.setTitle(day, for: .normal)

                            self.dayArray.removeFirst()
                        } else {
                            // after last day in 6th week
                            button.setTitle("", for: .normal)
                            button.isEnabled = false

                            if row == 6 {
                                if weekDay == 1 { // if 6th week is empty
                                    horizontalStackView.isHidden = true
                                    return
                                } else {
                                    horizontalStackView.isHidden = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // set year and month label
    func setLabel() {
        self.yearLabel.text = String(format: "%d", self.inputYear)
        self.monthLabel.text = String(format: "%02d", self.inputMonth)
    }

    // set day to dayArray from 1 to lastDay(28, 30, 31) of month
    func setDayArray() {
        for day in 1...self.lastDay {
            self.dayArray.append(String(day))
        }
    }

    // mark today icon (blue dot)
    func setTodayIcon(button: DayButton, day: String?) {
        let todayString = Useful.intToString(self.todayDay)

        if isTodayMonth && day == todayString {
            button.todayIconImageView.isHidden = false
        } else {
            button.todayIconImageView.isHidden = true
        }
    }

    // set dayButton's color
    func setDayButtonStyle(button: DayButton, weekDay: Int, enabled: Bool) {
        button.isEnabled = enabled

        if enabled {
            if weekDay == 1 { // Sunday
                button.setTitleColor(self.sundayColor, for: .normal)
            } else if weekDay == 7 { // Saturday
                button.setTitleColor(self.saturdayColor, for: .normal)
            } else { // Weekday
                button.setTitleColor(self.defaultDayColor, for: .normal)
            }
        } else {
            if weekDay == 1 { // Sunday
                button.setTitleColor(self.disabledSundayColor, for: .normal)
            } else if weekDay == 7 { // Saturday
                button.setTitleColor(self.disabledSaturdayColor, for: .normal)
            } else { // Weekday
                button.setTitleColor(self.disabledDefaultDayColor, for: .normal)
            }
        }
    }

    // MARK: - Click Event

    @objc func changeMonthOrYear(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "previousMonth":
            self.inquiryDate = Useful.addDate(self.inquiryDate, year: 0, month: -1, day: 0) ?? Date()
        case "nextMonth":
            self.inquiryDate = Useful.addDate(self.inquiryDate, year: 0, month: 1, day: 0) ?? Date()
        case "previousYear":
            self.inquiryDate = Useful.addDate(self.inquiryDate, year: -1, month: 0, day: 0) ?? Date()
        case "nextYear":
            self.inquiryDate = Useful.addDate(self.inquiryDate, year: 1, month: 0, day: 0) ?? Date()
        default:
            break
        }

        self.setupDate()
        self.setupCalendar()
    }

    @objc func selectDayButton(_ sender: UIButton) {
        if let day = sender.titleLabel?.text {
            var component = self.calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self.inquiryDate)
            component.day = Int(day) ?? 1

            if let selectedDate = self.calendar.date(from: component) {
                let formattedDate = Useful.dateToString(selectedDate, format: self.dateFormat)
                if let handler = self.selectHandler {
                    handler(formattedDate)
                    self.dismissView()
                }
            }
        }
    }

    // MARK: - View Life Cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            setLandscapeMode(false)
        case .landscapeLeft, .landscapeRight:
            setLandscapeMode(true)
        default:
            break
        }
    }

    private func setLandscapeMode(_ isOn: Bool) {
        if isOn {
            self.contentViewWidthByViewWidthConstarint.isActive = !isOn
            self.contentViewWidthByViewHeightConstarint.isActive = isOn
        } else {
            self.contentViewWidthByViewHeightConstarint.isActive = isOn
            self.contentViewWidthByViewWidthConstarint.isActive = !isOn
        }
    }

    // MARK: - LimitedCalendar Usage

    public func show() {
        DispatchQueue.main.async {
            if self.windowNotReady() {
                return
            }

            self.setupViews()
            self.setupAutoLayout()
            self.setupCalendar()

            self.modalPresentationStyle = .overFullScreen
            UIApplication.topViewController()?.present(self, animated: false, completion: nil)
        }
    }

    @objc public func dismissView() {
        DispatchQueue.main.async {
            self.view.alpha = 1

            UIView.animate(withDuration: self.hideDuration, animations: {
                self.view.alpha = 0
            }, completion: { _ in
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
}
