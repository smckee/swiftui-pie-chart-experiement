//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

struct PieChartLegend: View {
	
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var settings: PieChartSettings

	var body: some View {
		return (
			GStack(rows: 5, columns: 3) { index, row, col in
				if index < self.settings.normalizedData.count && self.settings.normalizedData[index].index != nil {
					HStack(spacing: 3) {
						Circle().fill(self.settings.normalizedData[index].color(forScheme: self.colorScheme)).frame(width: 16, height: 16)
						Text(self.settings.normalizedData[index].label ?? "").font(.footnote)
					}
					.frame(alignment: .leading)
					.onTapGesture {
						self.settings.configPanelVisible = false
						withAnimation(.spring(dampingFraction: 0.6)) {
							self.settings.selectedSegment = index
						}
					}
				}
			}
		)
	}
}
