import SwiftUI

public struct CardStackCustom<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
    @State private var xOffset: CGFloat = 0
    private let data: Data
    @ViewBuilder private let content: (Data.Element) -> Content
    @Binding var finalCurrentIndex: Int
    
    public init(_ data: Data, currentIndex: Binding<Int> = .constant(0), @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
        _finalCurrentIndex = currentIndex
    }
    
    public var body: some View {
        VStack {
            content(currentCard)
                .zIndex(1)
                .offset(x: xOffset, y: 0)
                .scaleEffect(scale(for: finalCurrentIndex), anchor: .center)
                .rotationEffect(.degrees(rotationDegrees(for: finalCurrentIndex)))
            HStack{
                Spacer(minLength: 60)
                          Button(action: {
                              swipeCard(to: .left)
                          }) { ZStack{
                              Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 110.0, height: 110.0)
                                  .background(Color(white: 1.0))
                                  .opacity(0.5021420433407738)
                                  .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0).cornerRadius(90)
                              Image("NotLike")
                                  .frame(width: 100.5, height: 100.5)
                                  .background(Color(white: 1.0, opacity: 0.11))
                                  .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0)
                          }
                              Spacer()
                          }
                          
                          Button(action: {
                              swipeCard(to: .right) 
                          }) {
                              ZStack{
                                  Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 110.0, height: 110.0)
                                      .background(Color(white: 1.0))
                                      .opacity(0.5021420433407738)
                                      .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0).cornerRadius(90)
                                  Image("Like")
                                      .foregroundColor(.clear)
                                      .frame(width: 100.5, height: 100.5)
                                      .background(Color(white: 1.0, opacity: 0.11))
                                      .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 24.0, x: 0.0, y: 11.0)
                              }
                              Spacer(minLength: 60)
                          }
                      }.padding(.top,22)
        }
    }
    
    private var currentCard: Data.Element {
        data[index(for: finalCurrentIndex) as! Data.Index]
    }
    
    private func swipeCard(to direction: SwipeDirection) {
        withAnimation(
            Animation.interpolatingSpring(stiffness: 100, damping: 20, initialVelocity: 10)
        ) {
            if direction == .right {
                xOffset = UIScreen.main.bounds.width
            } else {
                xOffset = -UIScreen.main.bounds.width
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.finalCurrentIndex += 1
            self.xOffset = 0
        }
    }
    
    private func index(for position: Int) -> Int {
        position % data.count
    }
    
    private func scale(for index: Int) -> CGFloat {
        return 1.0 - (0.1 * abs(currentPosition(for: index)))
    }
    
    private func rotationDegrees(for index: Int) -> Double {
        return -currentPosition(for: index) * 2
    }
    
    private func currentPosition(for index: Int) -> Double {
        Double(CGFloat(finalCurrentIndex - index))
    }
    
    private enum SwipeDirection {
        case left, right
    }
}

// Example usage
struct CardStackView_Previews: PreviewProvider {
    struct DemoItem: Identifiable {
        let name: String
        let color: Color
        
        var id: String {
            name
        }
    }

    struct DemoView: View {
        @State private var currentIndex = 0

        var body: some View {
            let colors = [
                DemoItem(name: "Red", color: .red),
                DemoItem(name: "Orange", color: .orange),
                DemoItem(name: "Yellow", color: .yellow),
                DemoItem(name: "Green", color: .green),
                DemoItem(name: "Blue", color: .blue),
                DemoItem(name: "Purple", color: .purple),
            ]

            VStack {
                CardStackCustom(colors, currentIndex: $currentIndex) { namedColor in
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(namedColor.color)
                        .overlay(
                            Text(namedColor.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                        .frame(height: 400)
                        .padding(50)
                }
            }
        }
    }

    static var previews: some View {
        DemoView()
    }
}
