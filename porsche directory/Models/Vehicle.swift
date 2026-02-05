import Foundation

// MARK: - Vehicle

struct Vehicle: Identifiable {
    let id = UUID()
    let name: String
    let model: String
    let year: Int
    let trim: String
    let engineType: String
    let vin: String

    // Live stats
    var fuelLevel: Double          // 0.0 – 1.0
    var mileage: Int               // km
    var averageFuelConsumption: Double // L / 100 km
    var estimatedRange: Int        // km

    // Service
    var nextServiceDate: Date
    var nextServiceMileage: Int

    // Computed
    var fuelIsLow: Bool { fuelLevel < 0.2 }

    var kmUntilService: Int {
        max(nextServiceMileage - mileage, 0)
    }

    var daysUntilService: Int {
        let cal = Calendar.current
        let days = cal.dateComponents([.day], from: .now, to: nextServiceDate).day ?? 0
        return max(days, 0)
    }
}

// MARK: - Maintenance Record

struct MaintenanceRecord: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let mileage: Int
    let description: String
    let isCompleted: Bool
}

// MARK: - Maintenance Item (Upcoming)

struct MaintenanceItem: Identifiable {
    let id = UUID()
    let title: String
    let dueDate: Date
    let dueMileage: Int
    var reminderEnabled: Bool

    var daysUntilDue: Int {
        let cal = Calendar.current
        let days = cal.dateComponents([.day], from: .now, to: dueDate).day ?? 0
        return max(days, 0)
    }
}

// MARK: - Fuel / Service Station

struct NearbyStation: Identifiable {
    let id = UUID()
    let name: String
    let distance: Double // km
    let type: StationType
}

enum StationType: String {
    case gasStation     = "Gas Station"
    case porscheCenter  = "Porsche Center"
}
