//
//  NoteModel.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct Note: Identifiable {
	var id = UUID().uuidString
	var note: String
	var date: Date
	var cardColor: Color
	
	
	static let sampleNote = Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: 1), cardColor: Color("Blue"))
}


// SampleData

func getSampleDate(offset: Int) -> Date {
	let calender = Calendar.current
	
	let date = calender.date(byAdding: .day, value: offset, to: Date())
	
	return date ?? Date()
}


var notes: [Note] = [
	
	Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: 1), cardColor: Color("Blue")),
	
	Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: -10), cardColor: Color("Green")),
	
	Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: -15), cardColor: Color("Red")),
	
	Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: 10), cardColor: Color("Purple")),
	
	Note(note: "The beginning of screenless desing UI Jobs to be taken..", date: getSampleDate(offset: -3), cardColor: Color("Blue"))

]
