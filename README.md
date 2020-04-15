# YYCalendar

![Swift](https://img.shields.io/badge/Swift-5.2-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)
[![License](https://img.shields.io/cocoapods/l/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)
[![Platform](https://img.shields.io/cocoapods/p/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)

## Introduction

When you need to let users choose date from calendar. You can use YYCalendar. Simple And Clear 😎

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Demo](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/demo_v1.0.0.gif)

## Usage

To create and show a calendar, first of all, import the module at the beginning of the file:

```swift
import YYCalendar
```

First of all, you can show the calendar as below:<br>
> *you have to equate **format** of date parameter with format parameter.*

```swift
let calendar = YYCalendar(normalCalendarLangType: .ENG, date: "07/01/2019", format: "MM/dd/yyyy") { date in
    print(date)
}

calendar.show()
```

You can set calendar style properties (color, font, ...)

```swift
calendar.dayButtonStyle = DayButtonStyle (.roundishSquare, .square, .circle)
calendar.dimmedBackgroundColor = UIColor
calendar.dimmedBackgroundAlpha = CGFloat
calendar.headerViewBackgroundColor = UIColor
calendar.bodyViewBackgroundColor = UIColor
calendar.sundayColor = UIColor
calendar.disabledSundayColor = UIColor
calendar.saturdayColor = UIColor
calendar.disabledSaturdayColor = UIColor
calendar.defaultDayColor = UIColor
calendar.disabledDefaultDayColor = UIColor
calendar.lineSeparatorColor = UIColor
calendar.selectedDayColor = UIColor
calendar.headerLabelFont = UIFont
calendar.weekLabelFont = UIFont
calendar.dayLabelFont = UIFont
```

## Calendar Type

There are two types of calendar.

| Calendar Type | Description |
|---|---|
| normal | you can select all of the date periods |
| limited | you can limit selectable date periods |

```swift
// normal type
init(normalCalendarLangType langType: LangType, date: String, format: String, completion: @escaping SelectHandler)

// limited type
init(limitedCalendarLangType langType: LangType, date: String, minDate: String?, maxDate: String?, format: String, completion: @escaping SelectHandler)
```

![normalType_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/normal_type.png) ![limitedType_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/limited_type.png)

## Language Type

The week label can be changed by selecting langType.

| langType | weekLabel |
|---|---|
| ENG | SUN, MON, TUE, WED, THU, FRI, SAT |
| ENG2 | Sun, Mon, Tue, Wed, Thu, Fri, Sat |
| ENG3 | S, M, T, W, T, F, S |
| KOR | 일, 월, 화, 수, 목, 금, 토 |
| JPN | 日, 月, 火, 水, 木, 金, 土 |
| CHN | 日, 一, 二, 三, 四, 五, 六 |
| custom | [String] |

![ENG_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng_week.png) ![ENG2_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng2_week.png) ![ENG3_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng3_week.png) ![KOR_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/kor_week.png) ![JPN_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/jpn_week.png) ![CHN_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/chn_week.png)

You can assign custom week label as below.

```swift
let weekArray = ["1", "2", "3", "4", "5", "6", "7"]
let calendar = YYCalendar(normalCalendarLangType: .custom(weekArray), date: "07/01/2019", format: "MM/dd/yyyy") { date in
    print(date)
}

calendar.show()
```

## Installation

YYCalendar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YYCalendar'
```

## Author

DevYeom, dev.yeom@gmail.com

## License

YYCalendar is available under the MIT license. See the LICENSE file for more info.
