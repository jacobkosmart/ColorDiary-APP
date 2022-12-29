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
	
	// For Newdata Sheet..
	@Published var isNewData = false
}
