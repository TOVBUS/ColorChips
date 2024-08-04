//
//  EyeBodyPhotoViewModel.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/4/24.
//

import Foundation
import SwiftData
import UIKit

@MainActor
class EyeBodyPhotoViewModel: ObservableObject {
    @Published var photos: [EyeBodyPhoto] = []
    private var context: ModelContext

    init(context: ModelContext) {
        self.context = context
        fetchEyeBodyPhotos()
    }

    func saveOrUpdateEyeBodyPhoto(date: String, images: [UIImage?]) {
        if let existingPhoto = photos.first(where: { $0.date == date }) {
            updateEyeBodyPhoto(existingPhoto, images: images)
        } else {
            let newPhoto = EyeBodyPhoto(date: date,
                                        frontImage: images[0],
                                        backImage: images[1],
                                        leftImage: images[2],
                                        rightImage: images[3])
            context.insert(newPhoto)
        }

        saveContext()
    }

    func updateEyeBodyPhoto(_ photo: EyeBodyPhoto, images: [UIImage?]) {
        photo.frontImageData = images[0]?.pngData()
        photo.rightImageData = images[1]?.pngData()
        photo.leftImageData = images[2]?.pngData()
        photo.backImageData = images[3]?.pngData()
        saveContext()
    }

    func fetchEyeBodyPhotos() {
        let descriptor = FetchDescriptor<EyeBodyPhoto>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        do {
            photos = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch EyeBodyPhotos: \(error)")
            photos = []
        }
    }

    func deleteEyeBodyPhoto(_ photo: EyeBodyPhoto) {
        context.delete(photo)
        saveContext()
    }

    private func saveContext() {
        do {
            try context.save()
            fetchEyeBodyPhotos()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
