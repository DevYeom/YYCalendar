//
//  Constants.swift
//  Pods
//
//  Created by DevYeom on 20/06/2019.
//

import Foundation

// MARK: - Type Alias
public typealias SelectHandler = (String) -> ()

// MARK: - Languages
let ENG_WEEK: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
let ENG2_WEEK: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
let ENG3_WEEK: [String] = ["S", "M", "T", "W", "T", "F", "S"]
let KOR_WEEK: [String] = ["일", "월", "화", "수", "목", "금", "토"]
let JPN_WEEK: [String] = ["日", "月", "火", "水", "木", "金", "土"]
let CHN_WEEK: [String] = ["日", "一", "二", "三", "四", "五", "六"]

// MARK: - Enumerations
public enum Components {
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
}

public enum DayButtonStyle {
    case roundishSquare
    case square
    case circle
}
