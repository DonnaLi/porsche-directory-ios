import SwiftUI

/// More Tab — Settings, documents, help, and secondary features.
struct MoreView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingLG) {

                    // MARK: - General
                    SectionHeaderView(title: "General")

                    SettingsGroupView {
                        SettingsRowView(
                            icon: "gearshape",
                            title: "Settings",
                            subtitle: "App preferences"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "bell",
                            title: "Notifications",
                            subtitle: "Manage alerts & reminders"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "moon",
                            title: "Appearance",
                            subtitle: "Dark mode"
                        )
                    }

                    // MARK: - Vehicle Documents
                    SectionHeaderView(title: "Documents")

                    SettingsGroupView {
                        SettingsRowView(
                            icon: "doc.text",
                            title: "Insurance",
                            subtitle: "Policy details"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "shield.checkered",
                            title: "Warranty",
                            subtitle: "Coverage information"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "doc.on.doc",
                            title: "Vehicle Registration"
                        )
                    }

                    // MARK: - Support
                    SectionHeaderView(title: "Support")

                    SettingsGroupView {
                        SettingsRowView(
                            icon: "questionmark.circle",
                            title: "Help & Support"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "envelope",
                            title: "Contact Us"
                        )

                        Divider().overlay(AppTheme.divider)

                        SettingsRowView(
                            icon: "info.circle",
                            title: "About",
                            subtitle: "Version 1.0"
                        )
                    }

                    // MARK: - Future Features Teaser
                    SectionHeaderView(title: "Coming Soon")

                    VStack(alignment: .leading, spacing: AppTheme.spacingSM) {
                        futureFeatureRow(icon: "chart.line.uptrend.xyaxis", title: "Driving History")
                        futureFeatureRow(icon: "dollarsign.circle", title: "Expense Tracking")
                        futureFeatureRow(icon: "bubble.left.and.bubble.right", title: "AI Assistant")
                        futureFeatureRow(icon: "person.3", title: "Community & Events")
                        futureFeatureRow(icon: "flag.checkered", title: "Track Day Mode")
                        futureFeatureRow(icon: "car.2", title: "Multiple Vehicles")
                        futureFeatureRow(icon: "applewatch", title: "Apple Watch")
                    }
                    .padding(AppTheme.spacingMD)
                    .background(AppTheme.surfacePrimary)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                }
                .padding(.horizontal, AppTheme.spacingMD)
                .padding(.bottom, AppTheme.spacingXL)
            }
            .background(AppTheme.background)
            .navigationTitle("More")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }

    private func futureFeatureRow(icon: String, title: String) -> some View {
        HStack(spacing: AppTheme.spacingSM + 4) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppTheme.textTertiary)
                .frame(width: 24)

            Text(title)
                .font(.caption)
                .foregroundStyle(AppTheme.textTertiary)

            Spacer()

            Text("V2")
                .font(.system(size: 9, weight: .semibold))
                .foregroundStyle(AppTheme.textTertiary)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(AppTheme.textTertiary.opacity(0.5), lineWidth: 0.5)
                )
        }
    }
}

#Preview {
    MoreView()
}
