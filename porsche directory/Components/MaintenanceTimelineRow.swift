import SwiftUI

/// A single row in the maintenance timeline, with a connecting line indicator.
struct MaintenanceTimelineRow: View {
    let item: MaintenanceItem
    let isLast: Bool
    @Binding var reminderEnabled: Bool

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()

    var body: some View {
        HStack(alignment: .top, spacing: AppTheme.spacingMD) {
            // Timeline indicator
            VStack(spacing: 0) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 10, height: 10)
                    .padding(.top, 6)

                if !isLast {
                    Rectangle()
                        .fill(AppTheme.divider)
                        .frame(width: 1.5)
                        .frame(maxHeight: .infinity)
                }
            }
            .frame(width: 10)

            // Content
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(AppTheme.textPrimary)

                HStack(spacing: AppTheme.spacingSM) {
                    Label(Self.dateFormatter.string(from: item.dueDate),
                          systemImage: "calendar")
                    Text("  \(item.dueMileage.formatted()) km")
                }
                .font(.caption)
                .foregroundStyle(AppTheme.textSecondary)

                if item.daysUntilDue <= 60 {
                    Text("In \(item.daysUntilDue) days")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(AppTheme.textTertiary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(AppTheme.surfaceSecondary)
                        .clipShape(Capsule())
                }

                // Remind me toggle
                Toggle(isOn: $reminderEnabled) {
                    Text("Remind me")
                        .font(.caption)
                        .foregroundStyle(AppTheme.textSecondary)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.white))
                .padding(.top, 2)
            }
            .padding(.bottom, isLast ? 0 : AppTheme.spacingLG)
        }
    }
}

/// A compact row for maintenance history entries.
struct MaintenanceHistoryRow: View {
    let record: MaintenanceRecord

    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()

    var body: some View {
        HStack(alignment: .top, spacing: AppTheme.spacingMD) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 16))
                .foregroundStyle(Color(white: 0.45))
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 4) {
                Text(record.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(AppTheme.textPrimary)

                Text(record.description)
                    .font(.caption)
                    .foregroundStyle(AppTheme.textSecondary)
                    .lineLimit(2)

                HStack(spacing: AppTheme.spacingSM) {
                    Text(Self.dateFormatter.string(from: record.date))
                    Text("  \(record.mileage.formatted()) km")
                }
                .font(.caption2)
                .foregroundStyle(AppTheme.textTertiary)
            }

            Spacer()
        }
        .padding(.vertical, AppTheme.spacingSM)
    }
}
