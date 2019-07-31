//
//  Image.swift
//  Pods
//
//  Created by 60029596 on 31/07/2019.
//

import Foundation

@available(iOS 10.0, *)
enum Image {
    static let LeftArrowImage: UIImage? = UIImage(named: "calendar_prev", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    static let HighlightedLeftArrowImage: UIImage? = UIImage(named: "calendar_prev_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    static let RightArrowImage: UIImage? = UIImage(named: "calendar_next", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    static let HighlightedRightArrowImage: UIImage? = UIImage(named: "calendar_next_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    static let CloseImage: UIImage? = UIImage(named: "top_btn_close", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
    static let HighlightedCloseImage: UIImage? = UIImage(named: "top_btn_close_pr", in: Bundle(for: YYCalendar.self), compatibleWith: nil)
}
