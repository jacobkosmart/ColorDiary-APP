//
//  NoteViewModel.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

class NoteViewModel: ObservableObject {
	
	// property
	@Published var content = ""
	@Published var date = Date()
	@Published var searchText: String = ""
	
	
	init () {
		
	}
	
	// For Newdata Sheet..
	@Published var isNewData = false
	
	@Published var placeHolderText: String = "Write Here"
	
	
	
	// Checking and Updateing Date..
	let calender = Calendar.current
	func checkDate() -> String {
		if calender.isDateInToday(date) {
			return "Today"
		}
		else if calender.isDateInYesterday(date) {
			return "Yesterday"
		}
		else {
			return "Other day"
		}
	}
	
	func updateDate(value: String) {
		if value == "Today" {
			date = Date()
		}
		else if value == "Yesterday" {
			date = calender.date(byAdding: .day, value: -1, to: Date())!
		}
		else {
			// do something
		}
	}
	
}
