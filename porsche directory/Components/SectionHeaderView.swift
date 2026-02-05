import SwiftUI

/// Reusable section header with title and optional trailing action.
struct SectionHeaderView: View {
    let title: String
    var action: String? = nil
    var onAction: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .tracking(1.2)
                .textCase(.uppercase)
                .foregroundStyle(AppTheme.textSecondary)

            Spacer()

            if let action {
                Button(action) {
                    onAction?()
                }
                .font(.caption)
                .foregroundStyle(AppTheme.textTertiary)
            }
        }
    }
}

#Preview {
    SectionHeaderView(title: "Quick Stats", action: "See All")
        .padding()
        .background(AppTheme.background)
}
