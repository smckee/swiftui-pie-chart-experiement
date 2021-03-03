//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

public struct GStack<Content: View>: View {
    
    let rows: Int
    let columns: Int
    let content: (Int, Int, Int) -> Content

    public var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
				HStack(spacing: 12) {
                    ForEach(0 ..< self.columns, id: \.self) { col in
						self.content(col + (row * self.columns), row, col)
                    }
                }
            }
        }
    }

    public init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
