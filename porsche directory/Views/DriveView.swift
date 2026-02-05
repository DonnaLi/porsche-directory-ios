import SwiftUI

/// Drive Tab — Fuel, navigation, and nearby locations.
struct DriveView: View {
    let vehicle: Vehicle = MockData.vehicle
    let stations: [NearbyStation] = MockData.nearbyStations

    @State private var filter: StationFilter = .all

    enum StationFilter: String, CaseIterable {
        case all            = "All"
        case gasStation     = "Gas Stations"
        case porscheCenter  = "Porsche Centers"
    }

    private var filteredStations: [NearbyStation] {
        switch filter {
        case .all:
            return stations
        case .gasStation:
            return stations.filter { $0.type == .gasStation }
        case .porscheCenter:
            return stations.filter { $0.type == .porscheCenter }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingLG) {

                    // MARK: - Fuel Status Card
                    VStack(alignment: .leading, spacing: AppTheme.spacingMD) {
                        HStack {
                            Image(systemName: "fuelpump.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(AppTheme.textSecondary)

                            Text("When should I get gas?")
                                .font(.headline)
                                .foregroundStyle(AppTheme.textPrimary)
                        }

                        HStack(spacing: AppTheme.spacingXL) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Estimated Range")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.textSecondary)
                                Text("\(vehicle.estimatedRange) km")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(AppTheme.textPrimary)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Fuel Level")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.textSecondary)
                                Text("\(Int(vehicle.fuelLevel * 100))%")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(AppTheme.textPrimary)
                            }
                        }

                        // Fuel bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(AppTheme.surfaceSecondary)
                                    .frame(height: 8)

                                RoundedRectangle(cornerRadius: 4)
                                    .fill(vehicle.fuelIsLow
                                          ? Color.white
                                          : Color(white: 0.6))
                                    .frame(
                                        width: geo.size.width * vehicle.fuelLevel,
                                        height: 8
                                    )
                            }
                        }
                        .frame(height: 8)

                        if vehicle.fuelIsLow {
                            HStack(spacing: 6) {
                                Image(systemName: "exclamationmark.triangle")
                                    .font(.caption)
                                Text("Consider refueling soon")
                                    .font(.caption)
                            }
                            .foregroundStyle(Color(white: 0.7))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.white.opacity(0.08))
                            .clipShape(Capsule())
                        }
                    }
                    .cardStyle()

                    // MARK: - Map Placeholder
                    SectionHeaderView(title: "Nearby Locations")

                    VStack(spacing: 0) {
                        // Map placeholder
                        ZStack {
                            RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous)
                                .fill(AppTheme.surfaceSecondary)

                            VStack(spacing: AppTheme.spacingSM) {
                                Image(systemName: "map")
                                    .font(.system(size: 36, weight: .thin))
                                    .foregroundStyle(AppTheme.textTertiary)

                                Text("Map View")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.textTertiary)
                            }
                        }
                        .frame(height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                    }

                    // Open in Apple Maps button
                    Button {
                        // In a real app, this would open Apple Maps
                    } label: {
                        HStack {
                            Image(systemName: "arrow.triangle.turn.up.right.diamond")
                            Text("Open in Apple Maps")
                        }
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(AppTheme.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(AppTheme.surfaceSecondary)
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusSM, style: .continuous))
                    }

                    // MARK: - Station Filter
                    HStack(spacing: AppTheme.spacingSM) {
                        ForEach(StationFilter.allCases, id: \.self) { tab in
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    filter = tab
                                }
                            } label: {
                                Text(tab.rawValue)
                                    .font(.caption)
                                    .fontWeight(filter == tab ? .semibold : .regular)
                                    .foregroundStyle(filter == tab
                                                     ? AppTheme.textPrimary
                                                     : AppTheme.textTertiary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(filter == tab
                                                 ? AppTheme.surfaceSecondary
                                                 : Color.clear)
                                    .clipShape(Capsule())
                            }
                        }
                    }

                    // MARK: - Station List
                    VStack(spacing: 0) {
                        ForEach(Array(filteredStations.enumerated()), id: \.element.id) { index, station in
                            NearbyStationRow(station: station)

                            if index < filteredStations.count - 1 {
                                Divider().overlay(AppTheme.divider)
                            }
                        }
                    }
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.vertical, AppTheme.spacingSM)
                    .background(AppTheme.surfacePrimary)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                }
                .padding(.horizontal, AppTheme.spacingMD)
                .padding(.bottom, AppTheme.spacingXL)
            }
            .background(AppTheme.background)
            .navigationTitle("Drive")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    DriveView()
}
