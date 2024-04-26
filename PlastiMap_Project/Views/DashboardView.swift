import SwiftUI

struct DashboardView: View {
    var title: String
    var value: String
    var incrementAction: () -> Void
    var decrementAction: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 8)

            Text(value)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding(.vertical, 12)

            HStack(spacing: 40) {
                Button(action: decrementAction) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.red)
                }

                Button(action: incrementAction) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.green)
                }
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .background(Color.white.opacity(0.7))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}
