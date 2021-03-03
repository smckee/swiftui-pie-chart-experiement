//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

struct ChartConfigButton: View {
	@Environment(\.colorScheme) var colorScheme
	var error: Bool = true
	
    var body: some View {
		ZStack {
			Circle()
				.fill(Color.panel(for: self.colorScheme))
				.frame(width: 30, height: 30)
				.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 0)
			if !error {
				HStack(spacing: 2) {
					ForEach(0..<3) { _ in
						Circle()
							.fill(Color.foreground(for: self.colorScheme))
							.frame(width: 4, height: 4)
					}
				}
				.opacity(0.25)
			} else {
				Text("!!!")
					.font(.caption)
					.fontWeight(.heavy)
					.foregroundColor(Color.red)
			}
		}
    }
}

struct ChartConfigButton_Previews: PreviewProvider {
    static var previews: some View {
		ChartConfigButton()
    }
}
