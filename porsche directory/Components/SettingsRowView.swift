import SwiftUI

/// Standard row for the More/Settings tab.
struct SettingsRowView: View {
    let icon: String
    let title: String
    var subtitle: String? = nil
    var showChevron: Bool = true

    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(AppTheme.textSecondary)
                .frame(width: 28, height: 28)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(AppTheme.textTertiary)
                }
            }

            Spacer()

            if showChevron {
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(AppTheme.textTertiary)
            }
        }
        .padding(.vertical, AppTheme.spacingSM)
    }
}

/// A group of settings rows wrapped in a card.
struct SettingsGroupView<Content: View>: View {
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(spacing: 0) {
            content()
        }
        .padding(.horizontal, AppTheme.spacingMD)
        .padding(.vertical, AppTheme.spacingSM)
        .background(AppTheme.surfacePrimary)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
    }
}

#Preview {
    VStack(spacing: 12) {
        SettingsGroupView {
            SettingsRowView(icon: "gearshape", title: "Settings")
            Divider().overlay(AppTheme.divider)
            SettingsRowView(icon: "bell", title: "Notifications", subtitle: "Manage alerts")
        }
    }
    .padding()
    .background(AppTheme.background)
}
