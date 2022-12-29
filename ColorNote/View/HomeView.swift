//
//  HomeView.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/28.
//

import SwiftUI

struct HomeView: View {
	
	
	
	// property
	@ObservedObject var vm: NoteViewModel
	
	
    var body: some View {
		VStack (spacing: 15) {
			
			// 1. Search Bar
			HStack (spacing: 10) {
				Image(systemName: "magnifyingglass")
					.font(.title3)
					.foregroundColor(.gray)
				
				TextField("Search", text: $vm.searchText)
			} //: HSTACK
//			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.bottom, 10)
			.padding(.horizontal, 25)
			.overlay(
				Rectangle()
					.fill(Color.gray.opacity(0.1))
					.frame(height: 2)
					.padding(.horizontal, -25)
					.offset(y: 6),
				
				alignment: .bottom
				
			)
			
			
			// 2. Main
			ScrollView(.vertical, showsIndicators: false) {
				VStack (spacing: 15) {
					
					HStack (spacing: 15) {
						Text("My Color Diary")
							.font(.title.bold())
							.hLeading()
						
						
						
						// AddButton
						Button {
							// action
							vm.isNewData.toggle()
						} label: {
							ButtonLabel(name: "plus", backgroundColor: Color.black)
								.font(.body)
						}
						.sheet(isPresented: $vm.isNewData) {
							NewDataView(vm: vm)
						}
						
						// SettingButton
						Button {
							// action
						} label: {
							ButtonLabel(name: "gear", backgroundColor: Color.black)
								.font(.body)
						}


						
						
					}
				} //: VSTACK
				.padding(.top, 5)
//				.frame(maxWidth: .infinity, alignment: .leading)
				
				// Columns...
				let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
				
				LazyVGrid(columns: columns, spacing: 25) {
					// Color Notes
					ForEach(notes) {note in
						
						// CardView
						Card(note: note)
						
					} //: LOOP
				}  //: GRID
				.padding(.top, 10)
				
				
			} //: SCROLL
			
		} //: VSTACK
//		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.padding(.horizontal)
		.preferredColorScheme(.light)
    }
	
	
	// MARK: - VIEWBUILDER
	

	
	// Add Button Builder
	@ViewBuilder
	func AddButton() -> some View {
		Button {
			// action
		} label: {
			Image(systemName: "plus")
				.font(.title2)
				.foregroundColor(.white)
				.padding(15)
				.background(Color.black)
				.clipShape(Circle())
		}

	}
	
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: NoteViewModel())
    }
}
