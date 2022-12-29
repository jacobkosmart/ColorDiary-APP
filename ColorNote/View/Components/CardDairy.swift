//
//  CardDairy.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct CardDairy: View {
	
	@ObservedObject var vm: NoteViewModel
	
    var body: some View {
		ForEach(Array(vm.savedDaiary.enumerated()), id: \.element) { index, diary in
			
			VStack {
				Text(diary.content ?? "")
					.font(.body)
					.multilineTextAlignment(.leading)
					.lineLimit(3)
					.hLeading()
				
				HStack {
					Text(diary.date ?? Date() , style: .date)
						.foregroundColor(.black)
						.opacity(0.8)
						.hLeading()
					
					// Delete Button
					Button {
						// action
						withAnimation(Animation.easeInOut) {
							vm.deleteDiary(index: index)
						}
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
			} //: VSTACK
			.padding()
			.background(Color.gray)
			.cornerRadius(10)
		
		} //: LOOP
    }
}

struct CardDairy_Previews: PreviewProvider {
    static var previews: some View {
        CardDairy(vm: NoteViewModel())
    }
}
