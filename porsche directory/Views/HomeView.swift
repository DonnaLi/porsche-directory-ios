import SwiftUI

/// Home Tab — Calm snapshot of the car's current status.
struct HomeView: View {
    let vehicle: Vehicle = MockData.vehicle

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingLG) {

                    // MARK: - Vehicle Badge
                    VehicleBadgeView(vehicle: vehicle)
                        .padding(.top, AppTheme.spacingSM)

                    // MARK: - Quick Stats
                    SectionHeaderView(title: "Quick Stats")

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: AppTheme.spacingSM),
                            GridItem(.flexible(), spacing: AppTheme.spacingSM)
                        ],
                        spacing: AppTheme.spacingSM
                    ) {
                        StatCardView(
                            icon: "fuelpump",
                            label: "Fuel",
                            value: "\(Int(vehicle.fuelLevel * 100))%",
                            warning: vehicle.fuelIsLow
                        )

                        StatCardView(
                            icon: "gauge.open.with.lines.needle.33percent",
                            label: "Mileage",
                            value: "\(vehicle.mileage.formatted()) km"
                        )

                        StatCardView(
                            icon: "wrench.and.screwdriver",
                            label: "Next Service",
                            value: "in \(vehicle.kmUntilService.formatted()) km"
                        )

                        StatCardView(
                            icon: "road.lanes",
                            label: "Range",
                            value: "\(vehicle.estimatedRange) km"
                        )
                    }

                    // MARK: - Smart Insights
                    SectionHeaderView(title: "Insights")

                    VStack(spacing: AppTheme.spacingSM) {
                        if vehicle.fuelIsLow {
                            SmartCardView(
                                icon: "fuelpump.fill",
                                message: "You may need gas soon"
                            )
                        }

                        SmartCardView(
                            icon: "wrench.and.screwdriver",
                            message: "Next maintenance due in \(vehicle.daysUntilService) days"
                        )

                        SmartCardView(
                            icon: "mappin.and.ellipse",
                            message: "Nearest Porsche Center: 4.2 km"
                        )
                    }
                }
                .padding(.horizontal, AppTheme.spacingMD)
                .padding(.bottom, AppTheme.spacingXL)
            }
            .background(AppTheme.background)
            .navigationTitle("Home")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}
