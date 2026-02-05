import SwiftUI

/// Large vehicle silhouette card for the Car tab hero section.
struct VehicleHeroView: View {
    let vehicle: Vehicle

    var body: some View {
        VStack(spacing: AppTheme.spacingLG) {
            // Vehicle silhouette placeholder
            Image(systemName: "car.side")
                .font(.system(size: 80, weight: .thin))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.white, Color(white: 0.5)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: 120)

            VStack(spacing: 4) {
                Text("Porsche")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .tracking(3)
                    .textCase(.uppercase)
                    .foregroundStyle(AppTheme.textSecondary)

                Text(vehicle.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.textPrimary)

                Text("\(vehicle.year) \(vehicle.trim)")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textSecondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, AppTheme.spacingXL)
        .background(
            LinearGradient(
                colors: [AppTheme.surfaceSecondary, AppTheme.surfacePrimary],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous))
    }
}

/// Compact vehicle badge for the Home tab header.
struct VehicleBadgeView: View {
    let vehicle: Vehicle

    var body: some View {
        HStack(spacing: AppTheme.spacingSM + 4) {
            Image(systemName: "car.side")
                .font(.system(size: 28, weight: .thin))
                .foregroundStyle(AppTheme.textPrimary)

            VStack(alignment: .leading, spacing: 2) {
                Text(vehicle.model)
                    .font(.headline)
                    .foregroundStyle(AppTheme.textPrimary)

                Text("\(vehicle.year) \(vehicle.trim)")
                    .font(.caption)
                    .foregroundStyle(AppTheme.textSecondary)
            }

            Spacer()
        }
    }
}

#Preview {
    ScrollView {
        VehicleHeroView(vehicle: MockData.vehicle)
            .padding()
        VehicleBadgeView(vehicle: MockData.vehicle)
            .padding()
    }
    .background(AppTheme.background)
}
