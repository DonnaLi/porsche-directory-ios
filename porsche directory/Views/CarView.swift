import SwiftUI

/// Car Tab — Deep dive into the vehicle itself.
struct CarView: View {
    let vehicle: Vehicle = MockData.vehicle
    @State private var showVIN = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingLG) {

                    // MARK: - Hero Image
                    VehicleHeroView(vehicle: vehicle)

                    // MARK: - Vehicle Details
                    SectionHeaderView(title: "Vehicle Details")

                    VStack(spacing: 0) {
                        detailRow(label: "Model", value: vehicle.model)
                        detailDivider()
                        detailRow(label: "Year", value: "\(vehicle.year)")
                        detailDivider()
                        detailRow(label: "Trim", value: vehicle.trim)
                        detailDivider()
                        detailRow(label: "Engine", value: vehicle.engineType)
                        detailDivider()
                        vinRow()
                    }
                    .padding(AppTheme.spacingMD)
                    .background(AppTheme.surfacePrimary)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))

                    // MARK: - Performance Stats
                    SectionHeaderView(title: "Stats")

                    HStack(spacing: AppTheme.spacingLG) {
                        RingChartView(
                            progress: vehicle.fuelLevel,
                            label: "Fuel",
                            value: "\(Int(vehicle.fuelLevel * 100))%"
                        )

                        RingChartView(
                            progress: Double(vehicle.estimatedRange) / 500.0,
                            label: "Range",
                            value: "\(vehicle.estimatedRange) km"
                        )

                        RingChartView(
                            progress: 1.0 - (Double(vehicle.kmUntilService) / 5000.0),
                            label: "Service",
                            value: "\(vehicle.kmUntilService.formatted()) km"
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .cardStyle()

                    // MARK: - Consumption
                    SectionHeaderView(title: "Consumption")

                    VStack(alignment: .leading, spacing: AppTheme.spacingSM) {
                        HStack {
                            Text("Average")
                                .font(.subheadline)
                                .foregroundStyle(AppTheme.textSecondary)
                            Spacer()
                            Text(String(format: "%.1f L/100 km", vehicle.averageFuelConsumption))
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(AppTheme.textPrimary)
                        }

                        // Simple consumption bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(AppTheme.surfaceSecondary)
                                    .frame(height: 6)

                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white.opacity(0.7))
                                    .frame(
                                        width: geo.size.width * min(vehicle.averageFuelConsumption / 20.0, 1.0),
                                        height: 6
                                    )
                            }
                        }
                        .frame(height: 6)

                        HStack {
                            Text("Efficient")
                                .font(.caption2)
                                .foregroundStyle(AppTheme.textTertiary)
                            Spacer()
                            Text("Heavy")
                                .font(.caption2)
                                .foregroundStyle(AppTheme.textTertiary)
                        }
                    }
                    .cardStyle()

                    // MARK: - Total Mileage
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Total Mileage")
                                .font(.caption)
                                .foregroundStyle(AppTheme.textSecondary)
                            Text("\(vehicle.mileage.formatted()) km")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(AppTheme.textPrimary)
                        }
                        Spacer()
                    }
                    .cardStyle()
                }
                .padding(.horizontal, AppTheme.spacingMD)
                .padding(.bottom, AppTheme.spacingXL)
            }
            .background(AppTheme.background)
            .navigationTitle("Car")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }

    // MARK: - Helpers

    private func detailRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(AppTheme.textSecondary)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundStyle(AppTheme.textPrimary)
        }
        .padding(.vertical, AppTheme.spacingSM)
    }

    private func vinRow() -> some View {
        HStack {
            Text("VIN")
                .font(.subheadline)
                .foregroundStyle(AppTheme.textSecondary)
            Spacer()
            if showVIN {
                Text(vehicle.vin)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(AppTheme.textPrimary)
            } else {
                Button("Show") {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showVIN = true
                    }
                }
                .font(.caption)
                .foregroundStyle(AppTheme.textTertiary)
            }
        }
        .padding(.vertical, AppTheme.spacingSM)
    }

    private func detailDivider() -> some View {
        Divider().overlay(AppTheme.divider)
    }
}

#Preview {
    CarView()
}
