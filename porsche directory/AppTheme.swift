import SwiftUI

// MARK: - Design Tokens

/// Porsche Directory design system.
/// Black-and-white, grayscale palette — luxury, calm, minimal.
enum AppTheme {

    // MARK: Colors

    static let background       = Color(white: 0.04)
    static let surfacePrimary   = Color(white: 0.11)
    static let surfaceSecondary = Color(white: 0.15)
    static let surfaceElevated  = Color(white: 0.18)

    static let textPrimary   = Color.white
    static let textSecondary = Color(white: 0.55)
    static let textTertiary  = Color(white: 0.35)

    static let divider = Color(white: 0.18)
    static let accent  = Color.white

    // MARK: Spacing

    static let spacingXS:  CGFloat = 4
    static let spacingSM:  CGFloat = 8
    static let spacingMD:  CGFloat = 16
    static let spacingLG:  CGFloat = 24
    static let spacingXL:  CGFloat = 32

    // MARK: Corner Radius

    static let radiusSM: CGFloat = 10
    static let radiusMD: CGFloat = 16
    static let radiusLG: CGFloat = 22

    // MARK: Card Style

    static let cardShadowColor  = Color.black.opacity(0.45)
    static let cardShadowRadius: CGFloat = 12
    static let cardShadowY:      CGFloat = 4
}

// MARK: - View Modifiers

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(AppTheme.spacingMD)
            .background(AppTheme.surfacePrimary)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
            .shadow(color: AppTheme.cardShadowColor,
                    radius: AppTheme.cardShadowRadius,
                    y: AppTheme.cardShadowY)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
}
