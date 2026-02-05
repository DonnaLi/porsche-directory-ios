import SwiftUI

/// Contextual insight card — soft, rounded, one-line suggestion.
struct SmartCardView: View {
    let icon: String
    let message: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button {
            action?()
        } label: {
            HStack(spacing: AppTheme.spacingSM + 4) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(AppTheme.textSecondary)
                    .frame(width: 28)

                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textPrimary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(AppTheme.textTertiary)
            }
            .padding(.horizontal, AppTheme.spacingMD)
            .padding(.vertical, 14)
            .background(AppTheme.surfacePrimary)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 10) {
        SmartCardView(icon: "fuelpump.fill", message: "You may need gas soon")
        SmartCardView(icon: "wrench.and.screwdriver", message: "Next maintenance due in 30 days")
        SmartCardView(icon: "mappin.and.ellipse", message: "Nearest Porsche Center: 4.2 km")
    }
    .padding()
    .background(AppTheme.background)
}
