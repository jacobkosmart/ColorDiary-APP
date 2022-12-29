//
//  NewDataView.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct NewDataView: View {
	
	@ObservedObject var vm: NoteViewModel
	@Environment(\.managedObjectContext) var context
	
    var body: some View {
		VStack {
			HStack { 
				Text("\(vm.updateItem == nil ? "Add New" : "Update") Diary")
					.font(.largeTitle)
					.fontWeight(.heavy)
					.foregroundColor(.black)
					.hCenter()
					
				Button {
					if vm.updateItem == nil {
						vm.isNewData.toggle()
					} else {
						vm.addDairy(context: context)
					}
				} label: {
					Image(systemName: "xmark")
						.foregroundColor(.black)
						.font(.title)
				}
			} //: HSTACK
			.padding()
			
			
			// TextEditor Placeholder 만들기
			
			ZStack {
				if vm.content.isEmpty {
					TextEditor(text: $vm.placeHolderText)
						.foregroundColor(.gray)
						
						.padding()
				}  //: CONDITION
				TextEditor(text: $vm.content)
					.opacity(vm.content.isEmpty ? 0.25 : 1)
					.padding()
			} //: ZSTACK
			
			
			
			
			Divider()
				.padding(.horizontal)
			
			HStack {
				Text("When")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(.black)
					.hLeading()
			} //: HSTACK
			.padding(.horizontal)
			.padding(.top)
			
			HStack (spacing: 10) {
				DateButton(vm: vm, title: "Yesterday")
				
				DateButton(vm: vm, title: "Today")
				
				DatePicker("", selection: $vm.date, displayedComponents: .date)
					.labelsHidden()
			} //: HSTACK

			
			
			// AddBtn
			Button {
				vm.addDairy(context: context)
			} label: {
				Label {
					// title
					Text(vm.updateItem == nil ? "Add Now" : "Update")
						.font(.title)
						.foregroundColor(.white)
						.fontWeight(.bold)
				} icon: {
					Image(systemName: "plus")
						.foregroundColor(.white)
				}
				.padding(.vertical)
				.frame(width: CGFloat.screenWidth - 30)
				.background(
					LinearGradient(gradient: Gradient(colors: [Color("Green"), Color("Purple")]), startPoint: .leading, endPoint: .trailing)
				)
				.cornerRadius(10)

			}
			.padding()
			
			// disableing buttton when no data..
			.disabled(vm.content == "" ? true : false)
			.opacity(vm.content == "" ? 0.5 : 1)

			
		} //: VSTACK
		.background(Color.black.opacity(0.05))
    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView(vm: NoteViewModel())
    }
}
