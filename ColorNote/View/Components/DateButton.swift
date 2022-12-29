//
//  DateButton.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct DateButton: View {
	
	@ObservedObject var vm: NoteViewModel
	var title: String

	
    var body: some View {
		Button {
			// action
			vm.updateDate(value: title)
		} label: {
			Text(title)
				.foregroundColor(vm.checkDate() == title ? .white : .gray)
				.fontWeight(.bold)
				.padding(.vertical, 10)
				.padding(.horizontal, 20)
				.background(
					vm.checkDate() == title
					? LinearGradient(gradient: Gradient(colors: [Color("Green"), Color("Purple")]),startPoint: .leading, endPoint: .trailing)
					:LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
				)
				.cornerRadius(6)
			
		}

    }
}

struct DateButton_Previews: PreviewProvider {
    static var previews: some View {
        DateButton(vm: NoteViewModel(), title: "Sample")
    }
}
