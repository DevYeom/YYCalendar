//
//  Constants.swift
//  Pods
//
//  Created by DevYeom on 20/06/2019.
//

import Foundation

// MARK: - Type Alias

public typealias SelectHandler = (String) -> ()

// MARK: - Enumerations

public enum ComponentType {
    case normal
    case limited
}

public enum LangType {
    case ENG
    case ENG2
    case ENG3
    case KOR
    case JPN
    case CHN
    case custom(_ weekArray: [String])

    var week: [String] {
        switch self {
        case .ENG:
            return ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        case .ENG2:
            return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        case .ENG3:
            return ["S", "M", "T", "W", "T", "F", "S"]
        case .KOR:
            return ["일", "월", "화", "수", "목", "금", "토"]
        case .JPN:
            return ["日", "月", "火", "水", "木", "金", "土"]
        case .CHN:
            return ["日", "一", "二", "三", "四", "五", "六"]
        case .custom(let weekArray):
            return weekArray
        }
    }
}

public enum DayButtonStyle {
    case roundishSquare
    case square
    case circle
}
