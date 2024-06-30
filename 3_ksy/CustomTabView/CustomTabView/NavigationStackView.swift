//
//  NavigationStackView.swift
//  CustomView
//
//  Created by 김수영 on 6/30/24.
//

import SwiftUI

struct NavigationStackView: View {
    let apple = ["Mac", "MacBook", "iPhone", "iPad"]
    @State private var stackPath: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $stackPath){
            List(apple, id: \.self) { product in
                Button {
                    stackPath.append(product)
                } label: {
                    Text(product)
                        .font(.largeTitle)
                }
                
                Button {
                    stackPath.append(1)
                } label: {
                    Text("넘버로 네비게이션")
                }
            }
            .navigationTitle("네비게이션 스택")
            .navigationDestination(for: String.self) { product in
                   AppleView(product: product, path: $stackPath)
            }
            .navigationDestination(for: Int.self) { number in
                Text("넘버가 선택되었습니다!")
            }
        }
    }
}

struct AppleView: View {
    let product: String
    @Binding var path: NavigationPath
    var body: some View {
        VStack(spacing: 20) {
            Text(product)
                .onTapGesture {
                    path.append("3rd or more deep")
                }
            Text("All Delete")
                .onTapGesture {
                    path = .init()
            }
        }
    }
}

//@MainActor
//class FirstDestinationViewModel: ObservableObject {
//    @Published var image: UIImage? = nil
//
//    init() {
//        downloadImage()
//    }
//    func downloadImage() {
//        Task {
//            let url = URL(string: "https://picsum.photos/200")!
//            let (data, response) = try await URLSession.shared.data(from: url)
//            if let image = UIImage(data: data) {
//                self.image = image
//                print("이미지 다운 끝!")
//            }
//        }
//    }
//}
//
//struct FirstDestinationView: View {
//    @StateObject private var viewModel: FirstDestinationViewModel
//
//    init(viewModel: FirstDestinationViewModel) {
//        print("목적지가 되는 뷰가 생성되었습니다!")
//
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }
//    var body: some View {
//        VStack {
//            if let image = viewModel.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//            }
//        }
//        Text("목적지가 되는 뷰")
//    }
//}

#Preview {
    NavigationStackView()
}
