//
//  ViewController.swift
//  YYCalendar
//
//  Created by SY.Yeom on 06/20/2019.
//  Copyright (c) 2019 DevYeom All rights reserved.
//

import UIKit
import YYCalendar

class ViewController: UIViewController {
	@IBOutlet weak var selectedDateLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func showCalendar(_ sender: UIButton) {
		let calendar = YYCalendar(date: "06/10/2019", format: "MM/dd/yyyy", disableAfterToday: false) { date in
			self.selectedDateLabel.text = date
		}

		calendar.show()
	}

	@IBAction func showCalendar2(_ sender: UIButton) {
		let calendar = YYCalendar(date: "06/10/2019", format: "MM/dd/yyyy", disableAfterToday: true) { date in
			self.selectedDateLabel.text = date
		}

		calendar.show()
	}
}

