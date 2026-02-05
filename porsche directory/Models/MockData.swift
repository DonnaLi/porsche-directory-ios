import Foundation

// MARK: - Sample Data

enum MockData {

    // MARK: Vehicle

    static let vehicle = Vehicle(
        name: "911 Carrera",
        model: "Porsche 911 Carrera",
        year: 2024,
        trim: "Carrera S",
        engineType: "3.0L Twin-Turbo Flat-6",
        vin: "WP0AB2A91RS••••••",
        fuelLevel: 0.35,
        mileage: 12_480,
        averageFuelConsumption: 10.2,
        estimatedRange: 185,
        nextServiceDate: Calendar.current.date(byAdding: .day, value: 30, to: .now)!,
        nextServiceMileage: 13_700
    )

    // MARK: Upcoming Maintenance

    static let upcomingMaintenance: [MaintenanceItem] = [
        MaintenanceItem(
            title: "Oil Change",
            dueDate: Calendar.current.date(byAdding: .day, value: 30, to: .now)!,
            dueMileage: 13_700,
            reminderEnabled: true
        ),
        MaintenanceItem(
            title: "Brake Inspection",
            dueDate: Calendar.current.date(byAdding: .day, value: 75, to: .now)!,
            dueMileage: 15_000,
            reminderEnabled: false
        ),
        MaintenanceItem(
            title: "Tire Rotation",
            dueDate: Calendar.current.date(byAdding: .day, value: 120, to: .now)!,
            dueMileage: 17_500,
            reminderEnabled: true
        ),
        MaintenanceItem(
            title: "Cabin Air Filter",
            dueDate: Calendar.current.date(byAdding: .day, value: 180, to: .now)!,
            dueMileage: 20_000,
            reminderEnabled: false
        )
    ]

    // MARK: Maintenance History

    static let maintenanceHistory: [MaintenanceRecord] = [
        MaintenanceRecord(
            title: "Oil & Filter Change",
            date: Calendar.current.date(byAdding: .month, value: -4, to: .now)!,
            mileage: 9_800,
            description: "Full synthetic oil change with OEM filter.",
            isCompleted: true
        ),
        MaintenanceRecord(
            title: "Brake Pad Replacement",
            date: Calendar.current.date(byAdding: .month, value: -7, to: .now)!,
            mileage: 7_200,
            description: "Front brake pads replaced. Rotors inspected.",
            isCompleted: true
        ),
        MaintenanceRecord(
            title: "Annual Inspection",
            date: Calendar.current.date(byAdding: .month, value: -12, to: .now)!,
            mileage: 4_500,
            description: "Full multi-point inspection. All systems normal.",
            isCompleted: true
        ),
        MaintenanceRecord(
            title: "First Service",
            date: Calendar.current.date(byAdding: .month, value: -18, to: .now)!,
            mileage: 1_600,
            description: "Initial break-in service completed.",
            isCompleted: true
        )
    ]

    // MARK: Nearby Stations

    static let nearbyStations: [NearbyStation] = [
        NearbyStation(name: "Shell — Hauptstraße",  distance: 1.3, type: .gasStation),
        NearbyStation(name: "Aral — Berliner Allee", distance: 2.1, type: .gasStation),
        NearbyStation(name: "Porsche Zentrum Stuttgart", distance: 4.2, type: .porscheCenter),
        NearbyStation(name: "Total — Schillerplatz",  distance: 5.0, type: .gasStation),
        NearbyStation(name: "Porsche Zentrum Ludwigsburg", distance: 12.8, type: .porscheCenter)
    ]
}
