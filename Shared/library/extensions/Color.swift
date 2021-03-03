//
//  Created by Shawn McKee on 11/19/20.
//  Copyright © 2020 Durable Brand Software LLC. All rights reserved.
//

import SwiftUI

public extension Color {
	
	// MARK: - BASIC UI -

	static func foreground(for scheme: ColorScheme) -> Color {
		if scheme == .dark { return Color(red: 1, green: 1, blue: 1, opacity: 1) }
		return Color(red: 0, green: 0, blue: 0, opacity: 1)
	}

	static func background(for scheme: ColorScheme) -> Color {
        if scheme == .dark { return Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1) }
        return Color(red: 1, green: 1, blue: 1, opacity: 1)
//		if scheme == .dark { return Color(red: 0.05, green: 0.05, blue: 0.05, opacity: 1) }
//		return Color(red: 1, green: 1, blue: 1, opacity: 1)
	}

    static func accent(for scheme: ColorScheme) -> Color {
        return Color.accentColor
    }

    static func placeholderFill(for scheme: ColorScheme) -> Color {
        #if os(OSX)
        if scheme == .dark { return Color(red: 1, green: 1, blue: 1, opacity: 0.05) }
        #else
        if scheme == .dark { return Color(red: 1, green: 1, blue: 1, opacity: 0.10) }
        #endif
        return Color(red: 0, green: 0, blue: 0, opacity: 0.05)
    }

	static func panel(for scheme: ColorScheme) -> Color {
        #if os(OSX)
        if scheme == .dark { return Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1) }
        return Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1)
        #else
        if scheme == .dark { return Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1) }
        return Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1)
        #endif
	}
    
    static func shield(for scheme: ColorScheme) -> Color {
        #if os(OSX)
        if scheme == .dark { return Color(red: 0, green: 0, blue: 0, opacity: 0.5) }
        #else
        if scheme == .dark { return Color(red: 0, green: 0, blue: 0, opacity: 0.5) }
        #endif
        return Color(red: 0, green: 0, blue: 0, opacity: 0.2)
    }

	static func overlay(for scheme: ColorScheme) -> Color {
		if scheme == .dark { return Color(red: 0, green: 0, blue: 0, opacity: 0.75) }
		return Color(red: 0, green: 0, blue: 0, opacity: 0.35)
	}

    static func visual(for scheme: ColorScheme) -> Color {
        if scheme == .dark { return Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1) }
        return Color(red: 0.45, green: 0.45, blue: 0.45, opacity: 1)
    }

    static func visualLabel(for scheme: ColorScheme) -> Color {
        if scheme == .dark { return Color(red: 0, green: 0, blue: 0, opacity: 1) }
        return Color(red: 1, green: 1, blue: 1, opacity: 1)
    }

	// MARK: - PALETTE -
	
	static var paletteFunctions: [(ColorScheme) -> Color] = [
		Color.blueberry,
		Color.strawberry,
		Color.orange,
		Color.banana,
		Color.guava,
		Color.plum,
		Color.mango,
	]
	
	static func palette(at index: Int, for scheme: ColorScheme) -> Color {
		return paletteFunctions[index % paletteFunctions.count](scheme)
	}

	static func blueberry(for scheme: ColorScheme) -> Color {
		return Color.blue
	}

	static func strawberry(for scheme: ColorScheme) -> Color {
		return Color.red
	}

	static func orange(for scheme: ColorScheme) -> Color {
		return Color.orange
	}
	
	static func banana(for scheme: ColorScheme) -> Color {
		return Color.yellow
	}
	
	static func guava(for scheme: ColorScheme) -> Color {
		return Color.green
	}

	static func plum(for scheme: ColorScheme) -> Color {
		return Color.purple
	}
	
	static func mango(for scheme: ColorScheme) -> Color {
		return Color.pink
	}

}
