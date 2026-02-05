import SwiftUI

/// Maintenance Tab — Ownership care, timeline, and history.
struct MaintenanceView: View {
    let vehicle: Vehicle = MockData.vehicle
    @State private var upcomingItems: [MaintenanceItem] = MockData.upcomingMaintenance
    let history: [MaintenanceRecord] = MockData.maintenanceHistory

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingLG) {

                    // MARK: - Next Service Card
                    VStack(alignment: .leading, spacing: AppTheme.spacingMD) {
                        HStack {
                            Image(systemName: "wrench.and.screwdriver")
                                .font(.system(size: 18))
                                .foregroundStyle(AppTheme.textSecondary)

                            Text("Next Scheduled Service")
                                .font(.headline)
                                .foregroundStyle(AppTheme.textPrimary)
                        }

                        HStack(spacing: AppTheme.spacingXL) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Date")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.textSecondary)
                                Text(Self.dateFormatter.string(from: vehicle.nextServiceDate))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(AppTheme.textPrimary)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Mileage")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.textSecondary)
                                Text("\(vehicle.nextServiceMileage.formatted()) km")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(AppTheme.textPrimary)
                            }
                        }

                        // Days remaining indicator
                        HStack(spacing: 6) {
                            Image(systemName: "clock")
                                .font(.caption)
                            Text("In \(vehicle.daysUntilService) days  |  \(vehicle.kmUntilService.formatted()) km remaining")
                                .font(.caption)
                        }
                        .foregroundStyle(AppTheme.textSecondary)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(AppTheme.surfaceSecondary)
                        .clipShape(Capsule())
                    }
                    .cardStyle()

                    // MARK: - Upcoming Timeline
                    SectionHeaderView(title: "Maintenance Timeline")

                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(upcomingItems.enumerated()), id: \.element.id) { index, item in
                            MaintenanceTimelineRow(
                                item: item,
                                isLast: index == upcomingItems.count - 1,
                                reminderEnabled: $upcomingItems[index].reminderEnabled
                            )
                        }
                    }
                    .padding(AppTheme.spacingMD)
                    .background(AppTheme.surfacePrimary)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))

                    // MARK: - History
                    SectionHeaderView(title: "Service History")

                    VStack(spacing: 0) {
                        ForEach(Array(history.enumerated()), id: \.element.id) { index, record in
                            MaintenanceHistoryRow(record: record)

                            if index < history.count - 1 {
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
            .navigationTitle("Maintenance")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MaintenanceView()
}
