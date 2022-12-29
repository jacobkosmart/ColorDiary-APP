//
//  ContentView.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/28.
//

import SwiftUI


struct ContentView: View {
	
	// property
	@StateObject var vm = NoteViewModel()
	
	init() {
		
	}
	
	
	var body: some View {
		HomeView(vm: vm)
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
