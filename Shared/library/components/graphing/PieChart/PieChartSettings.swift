//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

public class PieChartSettings: ObservableObject {

	@Published var normalizedData = [PieChartData]()
	@Published var configPanelVisible = false
    @Published var legendVisible = false
    @Published var allLabelsVisible = false
	@Published var configButtonVisible = true
	@Published var selectedSegment = -1
	@Published var dataError: String?

	public func data(at index: Int) -> PieChartData? {
		if index >= 0 && index < normalizedData.count {
			return normalizedData[index]
		}
		return nil
	}
	
	
	public func populate(data: [PieChartData]) {
		var normalizedData = [PieChartData]()
		var currentTotal: Double = 0
		var error: String?
		for index in 0..<data.count {
			let data = data[index]
			var newData = PieChartData()
			newData.value = data.value
			newData.label = data.label
			newData.runningTotal = currentTotal
			newData.index = index
			currentTotal += newData.value
			if currentTotal > 100 {
				error = "data exceeds 100%"
				break
			}
			normalizedData.append(newData)
		}
		if (currentTotal < 100) {
			var fillerData = PieChartData()
			fillerData.value = 100 - currentTotal
			fillerData.runningTotal = currentTotal
			normalizedData.append(fillerData)
		}
		currentTotal = 0
		for data in normalizedData {
			currentTotal += data.value
		}
		self.selectedSegment = normalizedData.count > 0 ? 0 : -1
		self.normalizedData = normalizedData
		self.dataError = error
	}

}
