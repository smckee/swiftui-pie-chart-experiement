
//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//


import SwiftUI

@main
struct PieChartExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            HStack {
                PieChart()
                    .frame(width: 350)
            }
            .frame(height: 600)

        }
    }
}
