# YYCalendar

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)
[![License](https://img.shields.io/cocoapods/l/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)
[![Platform](https://img.shields.io/cocoapods/p/YYCalendar.svg?style=flat)](https://cocoapods.org/pods/YYCalendar)

## Introduction

When you need to let users choose date from calendar. You can use YYCalendar. Simple And Clear 😎

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://raw.githubusercontent.com/DevYeom/YYCalendar/master/ScreenShot/demo_v1.0.0.gif)

## Usage

To create and show a bottomSheet, first of all, import the module at the beginning of the file:

```swift
import YYCalendar
```

First of all, you can show the bottomUpTable as below:<br>
*you have to equate **format** of date parameter with format parameter.*

```swift
let calendar = YYCalendar(date: "06/10/2019", format: "MM/dd/yyyy", disableAfterToday: false) { date in
self.selectedDateLabel.text = date
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
