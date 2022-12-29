//
//  NoteViewModel.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI
import CoreData

class NoteViewModel: ObservableObject {
	
	// property
	@Published var content = ""
	@Published var date = Date()
	@Published var searchText: String = ""
	@Published var savedDaiary: [DairyEntity] = []
	
	let container: NSPersistentContainer
	
	
	init () {
		container = NSPersistentContainer(name: "DairyContainer")
		container.loadPersistentStores { ( descriptionm, error) in
			if let error = error {
				print("ERROR LOADING CORE DATA. \(error)")
			} else {
				print("SUCCESSFULLY LOAD CORE DATA")
			}
		}
		
		fetchDairy()
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
	
	func wrtieDiary(context: NSManagedObjectContext) {
		
		let newTask = Task(context: context)
		newTask.date = date
		newTask.content = content
		
		// saving data
		do {
			try context.save()
			// success means closing view
			isNewData.toggle()
		} catch {
			print(error.localizedDescription)
		}
	}
	
	func fetchDairy() {
		let request = NSFetchRequest<DairyEntity>(entityName: "DairyEntity")
		
		do {
			savedDaiary = try container.viewContext.fetch(request)
		} catch let error {
			print("ERROR FETCHING. \(error)")
		}
	}
	
	func addDairy(context: NSManagedObjectContext) {
		let newDairy = DairyEntity(context: context)
		newDairy.content = content
		newDairy.date = date
		
		// saving data
		do {
			try context.save()
			fetchDairy()
			isNewData.toggle()
		} catch let error {
			print("ERROR ADDDAIRY \(error)")
		}
	}
	
}
