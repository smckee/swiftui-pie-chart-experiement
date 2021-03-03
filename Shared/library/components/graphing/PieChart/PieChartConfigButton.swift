//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

struct PieChartConfigButton: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var settings = PieChartSettings()

    var body: some View {
		ChartConfigButton(error: settings.dataError != nil)
		.onTapGesture {
			self.settings.configPanelVisible.toggle()
		}
    }
}

struct PieChartConfigButton_Previews: PreviewProvider {
    static var previews: some View {
        PieChartConfigButton()
    }
}
