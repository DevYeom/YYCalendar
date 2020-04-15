//
//  SCFunc.swift
//  YYCalendar
//
//  Created by DevYeom on 20/06/2019.
//

import Foundation
import LocalAuthentication

class Useful {
    /**
     convert Int to String

     - Parameter value: input Int value

     - Returns: converted String
     */
    static func intToString(_ value: Int) -> String {
        return "\(value)"
    }

    /**
     convert String to Date

     - Parameter value: input String value
     - Parameter format: date format

     - Returns: converted Date
     */
    static func stringToDate(_ value: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        return dateFormatter.date(from: value)
    }

    /**
     convert Date to String

     - Parameter date: input Date value

     - Returns: converted String
     */
    static func dateToString(_ date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: date)
    }

    /**
     calculate date by adding parameters

     - Parameter date: target Date
     - Parameter year: add years to target date
     - Parameter month: add months to target date
     - Parameter day: add days to target date

     - Returns: added Date
     */
    static func addDate(_ date: Date, year: Int?, month: Int?, day: Int?) -> Date? {
        var dateComponent = DateComponents()

        dateComponent.year = year ?? 0
        dateComponent.month = month ?? 0
        dateComponent.day = day ?? 0

        return Calendar.current.date(byAdding: dateComponent, to: date)
    }

    /**
     easy to get UIColor

     - Parameter r: red color
     - Parameter g: green color
     - Parameter b: blud color

     - Returns: UIColor
     */
    static func getUIColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

internal extension Date {
    func startOfMonth() -> Date {
        var dateComponent = Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self))
        dateComponent.hour = 12
        dateComponent.minute = 0
        dateComponent.second = 0

        return Calendar.current.date(from: dateComponent)!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}

internal extension UIApplication {
    class func topViewController(root: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let navigation = root as? UINavigationController {
            return topViewController(root: navigation.visibleViewController)
        } else if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(root: selected)
        } else if let presented = root?.presentedViewController {
            return topViewController(root: presented)
        }

        return root
    }
}
