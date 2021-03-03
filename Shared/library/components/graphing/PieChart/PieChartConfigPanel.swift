//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

struct PieChartConfigPanel: View {
	
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var settings: PieChartSettings
	
	var body: some View {
		return (
			ZStack {
				HStack {
					if self.settings.dataError != nil {
						Text(self.settings.dataError!).foregroundColor(Color.red)
					}
					else {
						VStack(alignment: .leading) {
							Toggle(isOn: $settings.legendVisible.animation()) {
								Text("Show Legend")
							}
							Toggle(isOn: $settings.allLabelsVisible.animation()) {
								Text("Show All Labels")
							}
						}
					}
				}
				.padding()
				.background(Color.panel(for: colorScheme))
				.cornerRadius(4)
				.shadow(color: Color(
					red: 0,
					green: 0,
					blue: 0,
					opacity: 0.5
				),radius: 2, x: 0, y: 0)
			}
			.padding()
		)
	}
}
