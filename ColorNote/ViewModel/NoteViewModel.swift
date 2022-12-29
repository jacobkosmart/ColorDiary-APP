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
	@Published var updateItem: DairyEntity!
	
	let container: NSPersistentContainer
	let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
	
	
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
		
		if updateItem != nil {
			// Update Old Data..
			updateItem.date = date
			updateItem.content = content
			
			try! context.save()
			
			// remove updatingItem if successful
			updateItem = nil
			isNewData.toggle()
			content = ""
			date = Date()
			return
		}
		
		
		// Add New Data
		let newDairy = DairyEntity(context: context)
		newDairy.content = content
		newDairy.date = date
		
		// saving data
		do {
			try context.save()
			fetchDairy()
			content = ""
			date = Date()
			isNewData.toggle()
		} catch let error {
			print("ERROR ADDDAIRY \(error)")
		}
		
		
	}
	
	
	func deleteDiary(index: Int) {
		let entity = savedDaiary[index]
		container.viewContext.delete(entity)
		saveData()
		
	}
	
	func updateDiary(index: Int) {
		updateItem = savedDaiary[index]
		content = updateItem.content!
		date = updateItem.date!
		isNewData.toggle()
	}
	
	func saveData() {
		do {
			try container.viewContext.save()
			fetchDairy()
		} catch   let error {
			print("ERROR SavedData \(error)")
		}
	}

	
}
