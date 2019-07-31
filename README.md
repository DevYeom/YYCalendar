# YYCalendar

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
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
let calendar = YYCalendar(normalCalendarLangType: .ENG, date: "07/01/2019", format: "MM/dd/yyyy") { (date) in
    self.selectedDateLabel.text = date
}

calendar.show()
```

You can set calendar style properties (color, font, ...)

```swift
calendar.dimmedBackgroundColor: UIColor = UIColor.black
calendar.dimmedBackgroundAlpha: CGFloat = 0.5
calendar.headerViewBackgroundColor: UIColor = Useful.getUIColor(245, 245, 245)
calendar.bodyViewBackgroundColor: UIColor = Useful.getUIColor(255, 255, 255)
calendar.sundayColor: UIColor = Useful.getUIColor(235, 61, 79)
calendar.disabledSundayColor: UIColor = Useful.getUIColor(251, 197, 202)
calendar.saturdayColor: UIColor = Useful.getUIColor(53, 113, 214)
calendar.disabledSaturdayColor: UIColor = Useful.getUIColor(194, 212, 243)
calendar.defaultDayColor: UIColor = Useful.getUIColor(51, 51, 51)
calendar.disabledDefaultDayColor: UIColor = Useful.getUIColor(193, 193, 193)
calendar.lineSeparatorColor: UIColor = Useful.getUIColor(233, 233, 233)
calendar.headerLabelFont: UIFont = UIFont.systemFont(ofSize: 24)
calendar.weekLabelFont: UIFont = UIFont.systemFont(ofSize: 16)
calendar.dayLabelFont: UIFont = UIFont.systemFont(ofSize: 19)
```

## Calendar Type

There are two types of calendar.

| Calendar Type | Description |
|---|---|
| normal | you can select all of the date periods |
| limited | you can limit selectable date periods |

```swift
// normal type
init(normalCalendarLangType langType: LangType, date: String, format: String, completion: SelectHandler?)

// limited type
init(limitedCalendarLangType langType: LangType, date: String, minDate: String?, maxDate: String?, format: String, completion: SelectHandler?)
```

![normalType_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/normal_type.png) ![limitedType_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/limited_type.png)

## Language Type

Week label can be changed by selecting langType

| langType | weekLabel |
|---|---|
| ENG | SUN, MON, TUE, WED, THU, FRI, SAT |
| ENG2 | Sun, Mon, Tue, Wed, Thu, Fri, Sat |
| ENG3 | S, M, T, W, T, F, S |
| KOR | 일, 월, 화, 수, 목, 금, 토 |
| CHN | 日, 月, 火, 水, 木, 金, 土 |

![ENG_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng_week.png) ![ENG2_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng2_week.png) ![ENG3_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/eng3_week.png) ![KOR_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/kor_week.png) ![CHN_Sample](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/chn_week.png)

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
