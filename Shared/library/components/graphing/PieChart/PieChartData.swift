//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.

//

import SwiftUI

public struct PieChartData: Identifiable {
	public var id = UUID()
	public var value: Double = 0
	public var runningTotal: Double = 0
	public var label: String? = nil
	public var index: Int?
	
	public var isFiller: Bool {
		return index == nil
	}
	
	public func color(forScheme scheme: ColorScheme) -> Color {
		if let index = self.index {
			return Color.palette(at: index, for: scheme )
		}
		return Color.secondary.opacity(0.25)
	}
	
	public static var SAMPLE_DATA: [PieChartData] = [
		PieChartData(value: 15, label: "Blueberries"),
		PieChartData(value: 25, label: "Strawberries"),
		PieChartData(value: 14, label: "Oranges"),
		PieChartData(value: 18, label: "Bananas"),
		PieChartData(value: 10, label: "Guava"),
		PieChartData(value: 13, label: "Plums"),
		PieChartData(value: 5, label: "Mangoes"),
	]

}


