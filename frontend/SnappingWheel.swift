import SwiftUI
import UIKit

struct SnappingWheel: View {
    // MARK: - State Variables
    @State private var selectedIndex: Int = -1
    @State private var symbols: [String] = []
    @Binding var isLoggedIn: Bool
    
    // MARK: - Constants
    let zodiacSymbols = [
        "♈️", "♉️", "♊️", "♋️",
        "♌️", "♍️", "♎️", "♏️",
        "♐️", "♑️", "♒️", "♓️"
    ]
    
    let zodiacNames = [
        "Aries", "Taurus", "Gemini", "Cancer",
        "Leo", "Virgo", "Libra", "Scorpio",
        "Sagittarius", "Capricorn", "Aquarius", "Pisces"
    ]

    // Define a 3-column grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 30) {
            Text("Select Your Sign")
                .font(.system(size: 32, weight: .bold, design: .serif))
                .foregroundColor(.yellow)
                .padding(.top, 40)

            // MARK: - The 12 Buttons Grid
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<zodiacSymbols.count, id: \.self) { i in
                    Button(action: {
                        selectSign(i)
                        symbols.append(zodiacSymbols[i])
                        
                        if(symbols.count == 5) {
                            var result = attemptLogin(sequence: symbols)
                            symbols.removeAll(keepingCapacity: false)
                            self.isLoggedIn = result
                            
                        }
                    }) {
                        VStack {
                            Text(zodiacSymbols[i])
                                .font(.system(size: 40))
                            Text(zodiacNames[i])
                                .font(.caption)
                                .fontWeight(.bold)
                            
                        }
                        .frame(width: 100, height: 100)
                        // Change color if selected
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedIndex == i ? Color.yellow.opacity(0.2) : Color.white.opacity(0.05))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedIndex == i ? Color.yellow : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()

            Spacer()

            // MARK: - Selected Sign Display
            VStack {
                HStack(spacing: 10) {
                    // 2. Use ForEach to display the items in the array
                    ForEach(symbols, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding()
            }
            .padding(30)
            .background(Color.white.opacity(0.05))
            .cornerRadius(30)
            .padding(.bottom, 50)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    // MARK: - Helper Function
    private func selectSign(_ index: Int) {
        // Trigger Haptic Feedback
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        // Update state with a smooth spring animation
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            selectedIndex = index
        }
    }
    
    private func attemptLogin(sequence: [String]) -> Bool {
        return true
    }
}
