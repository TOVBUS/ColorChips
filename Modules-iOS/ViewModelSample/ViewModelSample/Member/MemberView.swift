//
//  MemberView.swift
//  ViewModelSample
//
//  Created by doyeonjeong on 8/6/24.
//

import SwiftUI

//struct MemberView: View {
//    @StateObject private var viewModel = MemberViewModel()
//    @State private var newMember = CreateMemberDto(nickname: "", profile_image: "", age: 0, gender: "", appleID: nil, kakaoID: nil, current_level: 1)
//    @State private var selectedImageIndex: Int = 0
//    @State private var showingImagePicker = false
//    @State private var inputImage: UIImage?
//    @State private var selectedMemberId: Int = 0
//    
//    private let profileImages = ["profile01", "profile02", "profile03", "profile04", "profile05", "profile06", "profile07", "profile08", "profile09", "profile10"]
//    
//    var body: some View {
//        NavigationView {
//            List {
//                Section(header: Text("Create Member")) {
//                    TextField("Nickname", text: $newMember.nickname)
//                    TextField("Age", value: $newMember.age, format: .number)
//                    TextField("Gender", text: $newMember.gender)
//                    
//                    TextField("Apple ID", text: Binding(
//                        get: { newMember.appleID ?? "" },
//                        set: { newMember.appleID = $0.isEmpty ? nil : $0 }
//                    ))
//                    
//                    TextField("Kakao ID", text: Binding(
//                        get: { newMember.kakaoID ?? "" },
//                        set: { newMember.kakaoID = $0.isEmpty ? nil : $0 }
//                    ))
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 19) {
//                            ForEach(0..<profileImages.count, id: \.self) { index in
//                                Image(uiImage: UIImage(named: profileImages[index])!)
//                                    .frame(width: 128, height: 128)
//                                    .onTapGesture {
//                                        selectedImageIndex = index
//                                        newMember.profile_image = profileImages[index]
//                                        if let image = UIImage(named: profileImages[index]) {
//                                            inputImage = image
//                                        }
//                                    }
//                            }
//                        }
//                    }
//                    
//                    Button("Create") {
//                        if let inputImage = inputImage, let imageData = inputImage.jpegData(compressionQuality: 0.6) {
//                            //let imageName = profileImages[selectedImageIndex] + ".png"
//                            viewModel.createMember(newMember, imageData: imageData)
//                        } else {
//                            print("Create Error 인풋 이미지 어쩌구")
//                        }
//                    }
//                }
//                Section(header: Text("Members")) {
//                    ForEach(viewModel.members) { member in
//                        Text(member.nickname)
//                    }
//                    .onDelete { indexSet in
//                        for index in indexSet {
//                            viewModel.deleteMember(id: viewModel.members[index].id!)
//                        }
//                    }
//                }
//                Section(header: Text("Get Member")) {
//                    TextField("Member ID", value: $selectedMemberId, format: .number)
//                    Button("Get") {
//                        viewModel.getMember(id: selectedMemberId)
//                    }
//                }
//                if let selectedMember = viewModel.selectedMember {
//                    Section(header: Text("Selected Member")) {
//                        Text(selectedMember.nickname)
//                    }
//                }
//                if let error = viewModel.error {
//                    Section {
//                        Text(error.localizedDescription)
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//            .navigationTitle("Member Management")
//        }
//    }
//}
//
//#Preview {
//    MemberView()
//}
