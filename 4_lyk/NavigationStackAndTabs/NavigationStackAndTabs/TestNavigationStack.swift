//
//  TestNavigationStack.swift
//  NavigationStackAndTabs
//
//  Created by 이유경 on 6/29/24.
//

import SwiftUI

struct TestNavigationStack: View {
    let appleProducts = ["mac", "macbook", "iphone", "ipad"]
    @State private var stackPath: NavigationPath = .init() //타입 상관없이
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List(appleProducts, id: \.self) { product in
                Button { //navigationLink가 아닌 Button을 사용해도 동일함
                    stackPath.append("\(product)")
                } label: {
                    Text(product)
                        .font(.largeTitle)
                        .bold()
                }
                
                Button {
                    stackPath.append(1)
                } label: {
                    Text("넘버로 네비게이션")
                }
            }
            .navigationTitle("네비게이션 연습")
            .navigationDestination(for: String.self) { product in
                AppleProductView(product: product, path: $stackPath)
            }
            .navigationDestination(for: Int.self) { number in
                Text("넘버가 선택됨")
            }
        }
    }
}

struct AppleProductView: View {
    let product: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text(product)
                .font(.largeTitle)
                .onTapGesture {
                    path.append("세번째 혹은 더 깊이")
                }
            Text("모두 없애기")
                .onTapGesture {
                    path = .init()
                }
        }
    }
}
//@MainActor
//class FistDestinationViewModel: ObservableObject {
//    @Published var image: UIImage? = nil
//
//    init() {
//        downloadImage()
//    }
//
//    func downloadImage() {
//        Task {
//            let url = URL(string: "https://picsum.photos/200")
//            let (data, response) = try await URLSession.shared.data(from: url!)
//            if let image = UIImage(data: data) {
//                self.image = image
//                print("이미지가 다운로드 되었습니다.")
//            }
//        }
//    }
//}
//
//struct FirstDestinationView: View {
//    @StateObject private var viewModel: FistDestinationViewModel
//
//    init(viewModel: FistDestinationViewModel) {
//        print("목적지가 되는 뷰가 생성되었습니다.")
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }
//
//    var body: some View {
//        VStack {
//            if let image = viewModel.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//            }
//            Text("목적지가 되는 뷰")
//        }
//    }
//}

#Preview {
    TestNavigationStack()
}
