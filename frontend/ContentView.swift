import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false //
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            // This calls your interactive wheel
            
            
            
            if(isLoggedIn == true) {
                homeView()
            } else {
                SnappingWheel(isLoggedIn: $isLoggedIn)
            }
            
            Spacer()
            
            Text("Rotate to select an option")
                .foregroundColor(.secondary)
        }
    }
}
