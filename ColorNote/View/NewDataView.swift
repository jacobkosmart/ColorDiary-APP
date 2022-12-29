//
//  NewDataView.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct NewDataView: View {
	
	@ObservedObject var vm: NoteViewModel
	
    var body: some View {
		VStack {
			HStack {
				Text("Add New Diary")
					.font(.largeTitle)
					.fontWeight(.heavy)
					.foregroundColor(.black)
			} //: HSTACK
			.padding()
			
			TextEditor(text: $vm.content)
				.padding()
			
			Divider()
				.padding(.horizontal)
			
			HStack {
				Text("When")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(.black)
				
				Spacer(minLength: 0)
			} //: HSTACK
			Spacer(minLength: 0)
		} //: VSTACK
    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView(vm: NoteViewModel())
    }
}
