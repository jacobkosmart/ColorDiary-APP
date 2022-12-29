//
//  Card.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct Card: View {
	
	// property
	let note: Note
	
	
    var body: some View {
		VStack {
			Text(note.note)
				.font(.body)
				.multilineTextAlignment(.leading)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack (spacing: 20) {
				Text(note.date, style: .date)
					.foregroundColor(.black)
					.opacity(0.8)
				
				Spacer()
				
				// Delete Button
				Button {
					// action
				} label: {
					ButtonLabel(name: "trash", backgroundColor: Color.red)
						.font(.system(size: 15))
				}
				
				// Edit Button
				Button {
					// action
				} label: {
					ButtonLabel(name: "pencil", backgroundColor: Color.black)
						.font(.system(size: 15))
				}

				
			} //: HSTACK
			.padding(.top, 55)
			
		} //: VSTACK
		.padding()
		.background(note.cardColor)
		.cornerRadius(10)
	}

}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
		Card(note: Note.sampleNote)
    }
}
