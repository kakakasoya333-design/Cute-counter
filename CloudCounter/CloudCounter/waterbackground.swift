import SwiftUI

struct WaterBackground: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.7),
                    Color.cyan.opacity(0.7)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Wave(phase: phase, amplitude: 20, frequency: 1.5)
                .fill(Color.white.opacity(0.25))
            
            Wave(phase: phase + .pi, amplitude: 25, frequency: 1.2)
                .fill(Color.white.opacity(0.15))
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                .linear(duration: 2)
                .repeatForever(autoreverses: false)
            ) {
                phase = .pi * 2
            }
        }
    }
}

struct Wave: Shape {
    var phase: CGFloat
    var amplitude: CGFloat
    var frequency: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height * 0.6))
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / width
            let sine = sin((relativeX * frequency * .pi * 2) + phase)
            let y = height * 0.6 + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}
