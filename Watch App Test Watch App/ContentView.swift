////
////  ContentView.swift
////  Watch App Test Watch App
////
////  Created by 서정덕 on 2022/11/05.
////
//
//import SwiftUI
//
////struct ContentView: View {
////    var body: some View {
////        ZStack {
////            Color.white
////            VStack{
////                HStack{
////                    Dot().
////                    Dot()
////                }
////
////                HStack{
////                    Dot()
////                    Dot()
////                }
////                HStack{
////                    Dot()
////                    Dot()
////                }
////            }
////        }
////        .ignoresSafeArea()
////    }
////
////}
////
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
////
////struct Dot: View {
////    var body: some View{
////        Image(systemName: "square.fill")
////            .resizable()
////            .scaledToFit()
////            .foregroundColor(.black)
////            .frame(width: 75.0)
////    }
////}
//
//
//struct ContentView: View {
//
//    @State var counter  = 0
//    @State var touching = false
//
//    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        ZStack {
//            Color.white
//            Text("\(counter)")
//        }
//        .onReceive(timer) { input in
//            guard self.touching else { return }
//            self.counter += 1
//        }
//        .gesture(DragGesture(minimumDistance: 0).onChanged { _ in
//            self.touching = true
//        }.onEnded { _ in
//            self.touching = false
//        })
//
//    }
//}
//
//extension View {
//    /// 뷰에 익스텐션 추가해서
//    /// A convenience method for applying `TouchDownUpEventModifier.`
//    func onTouchDownUp(pressed: @escaping ((Bool) -> Void)) -> some View {
//        self.modifier(TouchDownUpEventModifier(pressed: pressed))
//    }
//}
//
//struct TouchDownUpEventModifier: ViewModifier {
//    /// Keep track of the current dragging state. To avoid using `onChange`, we won't use `GestureState`
//    @State var dragged = false
//
//    /// A closure to call when the dragging state changes.
//    var pressed: (Bool) -> Void
//    func body(content: Content) -> some View {
//        content
//            .gesture(
//                DragGesture(minimumDistance: 0)
//                    .onChanged { _ in
//                        if !dragged {
//                            dragged = true
//                            pressed(true)
//                        }
//                    }
//                    .onEnded { _ in
//                        dragged = false
//                        pressed(false)
//                    }
//            )
//    }
//}
import SwiftUI

struct ContentView: View {
    @GestureState var translation: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(translation)
            .gesture(DragGesture().updating($translation) { value, state, _ in
                state = value.translation
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
