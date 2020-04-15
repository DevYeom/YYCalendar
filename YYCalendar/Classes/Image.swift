//
//  Image.swift
//  Pods
//
//  Created by DevYeom on 31/07/2019.
//

import Foundation

@available(iOS 10.0, *)
enum Image {
    static var leftArrow: UIImage? {
        return UIImage(named: "calendar_prev", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }

    static var highlightedLeftArrow: UIImage? {
        return UIImage(named: "calendar_prev_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }

    static var rightArrow: UIImage? {
        return UIImage(named: "calendar_next", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }

    static var highlightedRightArrow: UIImage? {
        return UIImage(named: "calendar_next_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }

    static var close: UIImage? {
        return UIImage(named: "top_btn_close", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }

    static var highlightedClose: UIImage? {
        return UIImage(named: "top_btn_close_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    }
}
