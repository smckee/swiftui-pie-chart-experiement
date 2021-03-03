//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

public struct PieChart: View {
	
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var settings = PieChartSettings()
	
	public init(data: [PieChartData] = PieChartData.SAMPLE_DATA) {
		settings.populate(data: data)
	}
	
    public var body: some View {
		return GeometryReader { geometry in
			ZStack {
				VStack { EmptyView() }
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.contentShape(Rectangle())
				.onTapGesture {
					self.settings.configPanelVisible = false
				}
				VStack(spacing: 0) {
					ZStack {
						ForEach(0..<self.settings.normalizedData.count) { index in
							PieChartSegment(settings: self.settings, number: index, within: geometry.size)
							.onTapGesture {
								if self.settings.configPanelVisible {
									self.settings.configPanelVisible = false
								} else {
									withAnimation(.spring(dampingFraction: 0.6)) {
										if (self.settings.selectedSegment == index) {
											self.settings.selectedSegment = -1
										} else {
											self.settings.selectedSegment = self.settings.normalizedData[index].index ?? self.settings.selectedSegment
										}
									}
								}
							}
						}
						if self.settings.configButtonVisible || self.settings.dataError != nil {
							PieChartConfigButton(settings: self.settings)
						}
						if self.settings.configPanelVisible {
							PieChartConfigPanel(settings: self.settings)
						}
					}
					if (self.settings.legendVisible) {
						PieChartLegend(settings: self.settings)
					}
				}
			}
		}
    }

}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
