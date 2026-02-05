import SwiftUI

/// Minimal grayscale ring chart for displaying a single metric (e.g. fuel level).
struct RingChartView: View {
    let progress: Double   // 0.0 – 1.0
    let label: String
    let value: String
    var lineWidth: CGFloat = 8
    var size: CGFloat = 90

    var body: some View {
        VStack(spacing: AppTheme.spacingSM) {
            ZStack {
                // Track
                Circle()
                    .stroke(AppTheme.surfaceSecondary, lineWidth: lineWidth)

                // Progress
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.white.opacity(0.85),
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.8), value: progress)

                Text(value)
                    .font(.system(size: size * 0.18, weight: .semibold, design: .rounded))
                    .foregroundStyle(AppTheme.textPrimary)
            }
            .frame(width: size, height: size)

            Text(label)
                .font(.caption)
                .foregroundStyle(AppTheme.textSecondary)
        }
    }
}

#Preview {
    HStack(spacing: 30) {
        RingChartView(progress: 0.35, label: "Fuel", value: "35%")
        RingChartView(progress: 0.72, label: "Range", value: "72%")
        RingChartView(progress: 0.91, label: "Service", value: "91%")
    }
    .padding(40)
    .background(AppTheme.background)
}
