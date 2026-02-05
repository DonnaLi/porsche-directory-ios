import SwiftUI

/// Compact stat card used on the Home tab for quick glanceable metrics.
struct StatCardView: View {
    let icon: String
    let label: String
    let value: String
    var warning: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.spacingSM) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(warning ? Color(white: 0.9) : AppTheme.textSecondary)

                Text(label)
                    .font(.caption)
                    .foregroundStyle(AppTheme.textSecondary)
            }

            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(AppTheme.textPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.spacingMD)
        .background(warning ? Color(white: 0.14) : AppTheme.surfacePrimary)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous)
                .strokeBorder(warning ? Color.white.opacity(0.15) : .clear, lineWidth: 1)
        )
    }
}

#Preview {
    HStack {
        StatCardView(icon: "fuelpump", label: "Fuel", value: "35%", warning: true)
        StatCardView(icon: "gauge.open.with.lines.needle.33percent", label: "Mileage", value: "12,480 km")
    }
    .padding()
    .background(AppTheme.background)
}
