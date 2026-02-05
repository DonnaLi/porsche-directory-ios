import SwiftUI

/// Row for displaying a nearby gas station or Porsche center.
struct NearbyStationRow: View {
    let station: NearbyStation

    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            Image(systemName: station.type == .gasStation ? "fuelpump" : "building.2")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(AppTheme.textSecondary)
                .frame(width: 32, height: 32)
                .background(AppTheme.surfaceSecondary)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

            VStack(alignment: .leading, spacing: 2) {
                Text(station.name)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textPrimary)

                Text(station.type.rawValue)
                    .font(.caption)
                    .foregroundStyle(AppTheme.textTertiary)
            }

            Spacer()

            Text(String(format: "%.1f km", station.distance))
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(AppTheme.textSecondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    VStack {
        NearbyStationRow(station: MockData.nearbyStations[0])
        NearbyStationRow(station: MockData.nearbyStations[2])
    }
    .padding()
    .background(AppTheme.background)
}
