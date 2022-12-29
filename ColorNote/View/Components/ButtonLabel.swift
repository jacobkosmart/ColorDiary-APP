//
//  ButtonLabel.swift
//  ColorNote
//
//  Created by Jacob Ko on 2022/12/29.
//

import SwiftUI

struct ButtonLabel: View {
	
	let name: String
	let backgroundColor: Color
	
    var body: some View {
		Image(systemName: name)
			.fontWeight(.bold)
			.foregroundColor(.white)
			.padding(10)
			.background(backgroundColor)
			.clipShape(Circle())
    }
}




struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
		ButtonLabel(name: "plus", backgroundColor: Color.black)
    }
}
