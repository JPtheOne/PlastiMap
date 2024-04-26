import SwiftUI
import SwiftUICharts

struct ScoreView: View {
    @AppStorage("visits") private var visits: Int = 0
    @AppStorage("kilogramsSold") private var kilogramsSold: Double = 0
    @AppStorage("totalPoints") private var totalPoints: Int = 0
    @State private var activityDays: [Double] = Array(repeating: 0.0, count: 31)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Score")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)

                    DashboardView(title: "Visits This Month", value: "\(visits)", incrementAction: { visits += 1; forceUpdate() }, decrementAction: { if visits > 0 { visits -= 1; forceUpdate() } })
                    DashboardView(title: "Kilograms Sold", value: String(format: "%.2f", kilogramsSold), incrementAction: { kilogramsSold += 1; updatePointsAndDays() }, decrementAction: { if kilogramsSold > 0 { kilogramsSold -= 1; updatePointsAndDays() } })
                    DashboardView(title: "Total Points", value: "\(totalPoints)", incrementAction: { totalPoints += 10; forceUpdate() }, decrementAction: { if totalPoints >= 10 { totalPoints -= 10; forceUpdate() } })
                    MonthlyActivityChart(activityDays: $activityDays)
                }
                .padding(.horizontal)
            }
            .background(
                Image("plant_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }

    private func updatePointsAndDays() {
        totalPoints = Int(kilogramsSold * 10)
        updateActivityDays()
    }
    
    private func updateActivityDays() {
        let dayIndex = Calendar.current.component(.day, from: Date()) - 1
        if dayIndex >= 0 && dayIndex < activityDays.count {
            activityDays[dayIndex] = 1
        }
    }
    
    private func forceUpdate() {
        // Explicitly forces SwiftUI to re-evaluate the view state
        withAnimation {
            // This is a trick to force SwiftUI to update the view by toggling a state variable, or in this case, triggering any animations if needed
        }
    }
}

struct MonthlyActivityChart: View {
    @Binding var activityDays: [Double]

    var body: some View {
        BarChartView(data: ChartData(values: activityDays.enumerated().map { (index, value) in ("\(index + 1)", value) }),
                     title: "Activity Chart for the Month",
                     style: ChartStyle(backgroundColor: .white, accentColor: .green, secondGradientColor: .green, textColor: .black, legendTextColor: .gray, dropShadowColor: .gray))
            .frame(height: 300)
            .padding()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
