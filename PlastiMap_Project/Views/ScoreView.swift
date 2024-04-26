import SwiftUI

struct ScoreView: View {
    @AppStorage("visits") private var visits: Int = 0
    @AppStorage("kilogramsSold") private var kilogramsSold: Double = 0
    @AppStorage("totalPoints") private var totalPoints: Int = 0
    @State private var activityDays: [Int] = Array(repeating: 0, count: 31)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Puntaje")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 44)

                    DashboardView(title: "Visits This Month", value: "\(visits)", incrementAction: { visits += 1 }, decrementAction: { if visits > 0 { visits -= 1 } })
                    DashboardView(title: "Kilograms Sold", value: String(format: "%.2f", kilogramsSold), incrementAction: { kilogramsSold += 1; updatePointsAndDays() }, decrementAction: { if kilogramsSold > 0 { kilogramsSold -= 1; updatePointsAndDays() } })
                    DashboardView(title: "Total Points", value: "\(totalPoints)", incrementAction: { totalPoints += 10 }, decrementAction: { if totalPoints >= 10 { totalPoints -= 10 } })
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
        let dayIndex = Calendar.current.component(.day, from: Date()) - 1
        if dayIndex >= 0 && dayIndex < activityDays.count {
            activityDays[dayIndex] = 1
        }
    }
}

struct DashboardView: View {
    var title: String
    var value: String
    var incrementAction: () -> Void
    var decrementAction: () -> Void
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)
            
            Text(value)
                .font(.title)
                .padding()
            
            HStack {
                Button(action: decrementAction) {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                Button(action: incrementAction) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MonthlyActivityChart: View {
    @Binding var activityDays: [Int]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Activity Chart for the Month")
                .font(.headline)
               
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(0..<activityDays.count, id: \.self) { day in
                    Rectangle()
                        .fill(activityDays[day] > 0 ? Color.green : Color.gray) // Use different colors based on activity
                        .frame(width: 5, height: CGFloat(activityDays[day] > 0 ? 20 : 5))
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.white.opacity(0.5))
        .cornerRadius(10)
        .frame(height: 50)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
