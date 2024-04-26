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
                .foregroundColor(.primary)  // Uses the default foreground color adapted to Dark/Light mode
                .padding(.top, 8)

            Text(value)
                .font(.system(size: 24, weight: .bold, design: .rounded))  // Making the value stand out more
                .padding(.vertical, 12)

            HStack(spacing: 40) {  // Increased spacing for better touch targets
                Button(action: decrementAction) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 36))  // Larger touch target
                        .foregroundColor(.red)
                }

                Button(action: incrementAction) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 36))  // Larger touch target
                        .foregroundColor(.green)
                }
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .background(Color.white.opacity(0.7))  // Slightly higher opacity for better readability
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)  // Subtle shadow for depth
    }
}
