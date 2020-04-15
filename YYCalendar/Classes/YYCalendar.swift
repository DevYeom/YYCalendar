//
//  YYCalendar.swift
//  YYCalendar
//
//  Created by DevYeom on 20/06/2019.
//

import Foundation

@available(iOS 10.0, *)
@objcMembers open class YYCalendar {
    // MARK: - Component Varialbes

    public var componentType: ComponentType
    public var normalCalendar: NormalCalendar?
    public var limitedCalendar: LimitedCalendar?

    // MARK: - Initialization

    public init(normalCalendarLangType langType: LangType, date: String, format: String, completion: @escaping SelectHandler) {
        componentType = .normal
        normalCalendar = NormalCalendar.init(langType: langType, date: date, format: format, completion: completion)
    }

    public init(limitedCalendarLangType langType: LangType, date: String, minDate: String?, maxDate: String?, format: String, completion: @escaping SelectHandler) {
        componentType = .limited
        limitedCalendar = LimitedCalendar.init(langType: langType, date: date, minDate: minDate, maxDate: maxDate, format: format, completion: completion)
    }

    // MARK: - Usage

    public func show() {
        switch componentType {
        case .normal:
            normalCalendar?.show()
        case .limited:
            limitedCalendar?.show()
        }
    }

    // MARK: - Calendar Style Properties

    public var dayButtonStyle: DayButtonStyle = .roundishSquare {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.dayButtonStyle = dayButtonStyle
                case .limited:
                    weakSelf.limitedCalendar?.dayButtonStyle = dayButtonStyle
                }
            }
        }
    }

    public var dimmedBackgroundColor: UIColor = UIColor.black {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.dimmedBackgroundColor = dimmedBackgroundColor
                case .limited:
                    weakSelf.limitedCalendar?.dimmedBackgroundColor = dimmedBackgroundColor
                }
            }
        }
    }

    public var dimmedBackgroundAlpha: CGFloat = 0.5 {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.dimmedBackgroundAlpha = dimmedBackgroundAlpha
                case .limited:
                    weakSelf.limitedCalendar?.dimmedBackgroundAlpha = dimmedBackgroundAlpha
                }
            }
        }
    }

    public var headerViewBackgroundColor: UIColor = Useful.getUIColor(245, 245, 245) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.headerViewBackgroundColor = headerViewBackgroundColor
                case .limited:
                    weakSelf.limitedCalendar?.headerViewBackgroundColor = headerViewBackgroundColor
                }
            }
        }
    }

    public var bodyViewBackgroundColor: UIColor = Useful.getUIColor(255, 255, 255) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.bodyViewBackgroundColor = bodyViewBackgroundColor
                case .limited:
                    weakSelf.limitedCalendar?.bodyViewBackgroundColor = bodyViewBackgroundColor
                }
            }
        }
    }

    public var sundayColor: UIColor = Useful.getUIColor(235, 61, 79) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.sundayColor = sundayColor
                case .limited:
                    weakSelf.limitedCalendar?.sundayColor = sundayColor
                }
            }
        }
    }

    public var disabledSundayColor: UIColor = Useful.getUIColor(251, 197, 202) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.disabledSundayColor = disabledSundayColor
                case .limited:
                    weakSelf.limitedCalendar?.disabledSundayColor = disabledSundayColor
                }
            }
        }
    }

    public var saturdayColor: UIColor = Useful.getUIColor(53, 113, 214) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.saturdayColor = saturdayColor
                case .limited:
                    weakSelf.limitedCalendar?.saturdayColor = saturdayColor
                }
            }
        }
    }

    public var disabledSaturdayColor: UIColor = Useful.getUIColor(194, 212, 243) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.disabledSaturdayColor = disabledSaturdayColor
                case .limited:
                    weakSelf.limitedCalendar?.disabledSaturdayColor = disabledSaturdayColor
                }
            }
        }
    }

    public var defaultDayColor: UIColor = Useful.getUIColor(51, 51, 51) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.defaultDayColor = defaultDayColor
                case .limited:
                    weakSelf.limitedCalendar?.defaultDayColor = defaultDayColor
                }
            }
        }
    }

    public var disabledDefaultDayColor: UIColor = Useful.getUIColor(193, 193, 193) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.disabledDefaultDayColor = disabledDefaultDayColor
                case .limited:
                    weakSelf.limitedCalendar?.disabledDefaultDayColor = disabledDefaultDayColor
                }
            }
        }
    }

    public var lineSeparatorColor: UIColor = Useful.getUIColor(233, 233, 233) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.lineSeparatorColor = lineSeparatorColor
                case .limited:
                    weakSelf.limitedCalendar?.lineSeparatorColor = lineSeparatorColor
                }
            }
        }
    }

    public var selectedDayColor: UIColor = Useful.getUIColor(55, 137, 220) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.selectedDayColor = selectedDayColor
                case .limited:
                    weakSelf.limitedCalendar?.selectedDayColor = selectedDayColor
                }
            }
        }
    }

    public var headerLabelFont: UIFont = UIFont.systemFont(ofSize: 24) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.headerLabelFont = headerLabelFont
                case .limited:
                    weakSelf.limitedCalendar?.headerLabelFont = headerLabelFont
                }
            }
        }
    }

    public var weekLabelFont: UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.weekLabelFont = weekLabelFont
                case .limited:
                    weakSelf.limitedCalendar?.weekLabelFont = weekLabelFont
                }
            }
        }
    }

    public var dayLabelFont: UIFont = UIFont.systemFont(ofSize: 19) {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                switch componentType {
                case .normal:
                    weakSelf.normalCalendar?.dayLabelFont = dayLabelFont
                case .limited:
                    weakSelf.limitedCalendar?.dayLabelFont = dayLabelFont
                }
            }
        }
    }
}
