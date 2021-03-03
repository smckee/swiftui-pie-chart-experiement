//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

struct PieChartSegment: View {
	
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var settings: PieChartSettings
	
	private var data: PieChartData
	private var number: Int
	
	var height: CGFloat
	var width: CGFloat
	
	var centerX: CGFloat
	var centerY: CGFloat
	var startAngle: Angle
	var centerAngle: Angle
	var endAngle: Angle
	var radius: CGFloat

	var selectedOffsetX: CGFloat
	var selectedOffsetY: CGFloat

	var labelOffsetX: CGFloat
	var labelOffsetY: CGFloat

	var shadowOpacity: Double
	
	var label: String
	var valueLabel: String

	init(settings: PieChartSettings, number: Int, within pieSize: CGSize) {
				
		self.settings = settings
		self.number = number
		self.data = settings.data(at: number)!
		
		
		width = pieSize.width
		if pieSize.width > pieSize.height { width = pieSize.height }
		height = width
		centerX = width/2
		centerY = centerX
		radius = centerX - 40

		let currentTotal = data.runningTotal
		let from = currentTotal
		let to = currentTotal + data.value
		
		startAngle = Angle(degrees: 360 * (from/100.0))
		centerAngle = Angle(degrees: 360 * ((from + data.value/2)/100.0))
		endAngle = Angle(degrees: 360 * (to/100.0))
		
		let angleDifference = endAngle.degrees - startAngle.degrees
		let sliceSize = (1.0 - CGFloat(angleDifference/360.0)) * 0.2
		
		let edgeX = centerX + radius * cos(CGFloat(centerAngle.radians))
		let edgeY = centerY + radius * sin(CGFloat(centerAngle.radians))
		
		let edgeDistance = sqrt(pow((edgeX - centerX),2) + pow((edgeY - centerY),2)) // distance between two points
		
		let selectedOffsetDistance = (edgeDistance * sliceSize)/edgeDistance // ratio of distance (move it 25%)
		selectedOffsetX = (((1 - selectedOffsetDistance) * centerX) + (selectedOffsetDistance * edgeX)) - centerX
		selectedOffsetY = (((1 - selectedOffsetDistance) * centerY) + (selectedOffsetDistance * edgeY)) - centerY

		let labelOffsetDistance = (edgeDistance * 0.55)/edgeDistance // ratio of distance (move it 25%)
		labelOffsetX = (((1 - labelOffsetDistance) * centerX) + (labelOffsetDistance * edgeX)) - centerX
		labelOffsetY = (((1 - labelOffsetDistance) * centerY) + (labelOffsetDistance * edgeY)) - centerY

		shadowOpacity = 0.65
		
		label = data.label?.uppercased() ?? ""
		
		let formatter = NumberFormatter()
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 1
		formatter.numberStyle = .decimal
		
		valueLabel = formatter.string(from: data.value as NSNumber) ?? "n/a"
	}

	var body: some View {
		let selected = settings.selectedSegment == number
		let labelVisible = (selected || settings.allLabelsVisible) && !data.isFiller
		let color = data.color(forScheme: self.colorScheme)
		return (
			ZStack {
				Path { path in
					path.move(to: CGPoint(x: width/2, y: height/2))
					path.addArc(center: .init(x: centerX, y: centerY),
								radius: radius,
								startAngle: startAngle,
								endAngle: endAngle,
								clockwise: false  // false makes it actually clockwise because of the reverse coordinate system.
						)
				}
				.fill(color)
				.opacity(selected ? 1.0 : 0.8)
				
				Path { path in
					path.move(to: CGPoint(x: width/2, y: height/2))
					path.addArc(center: .init(x: centerX, y: centerY),
								radius: radius,
								startAngle: startAngle,
								endAngle: endAngle,
								clockwise: false  // false makes it actually clockwise because of the reverse coordinate system.
						)
					path.closeSubpath()
				}
				.stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
				.foregroundColor(selected ? Color.primary : Color.clear)

				VStack {
					Text(label)
						.foregroundColor(Color.white)
						.fontWeight(.heavy)
						.font(.caption)
					Text(valueLabel)
						.foregroundColor(Color.white)
						.font(.footnote)
				}
				.padding(6)
				.background(Color.overlay(for: colorScheme))
				.cornerRadius(4)
				.rotationEffect(.degrees(-270))
				.offset(x: labelOffsetX, y: labelOffsetY)
				.opacity(labelVisible ? selected ? 1.0 : 0.7 : 0.0)

			}
			.frame(width: width, height: height)
			.offset(x: selected ? selectedOffsetX : 0, y: selected ? selectedOffsetY : 0)
			.rotationEffect(.degrees(270)) // rotate so segments start from top (12 o-clock)
			.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: selected ? shadowOpacity : 0), radius: 3, x: 0, y: 0)
		)
	}
}
