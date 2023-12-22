import SwiftUI

struct ActivityIndicator: View {
    @State private var rotation: Double = 0.0

    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0, to: 0.8) // Adjust trim as needed
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 152/255, green: 200/255, blue: 194/255))
                .rotationEffect(Angle(degrees: rotation))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.rotation = 360
                    }
                }
                .frame(width: 30, height: 30, alignment: .center)
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
