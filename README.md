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
let calendar = YYCalendar(langType: .ENG, date: "06/10/2019", format: "MM/dd/yyyy", disableAfterToday: false) { date in
self.selectedDateLabel.text = date
}

calendar.show()
```

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
