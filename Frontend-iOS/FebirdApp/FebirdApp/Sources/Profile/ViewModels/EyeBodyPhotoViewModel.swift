//
//  EyeBodyPhotoViewModel.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/4/24.
//

import SwiftUI
import SwiftData

@MainActor
class EyeBodyPhotoViewModel: ObservableObject {
    @Published var photos: [EyeBodyPhoto] = []

    func fetchEyeBodyPhotos(context: ModelContext) async {
        let descriptor = FetchDescriptor<EyeBodyPhoto>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        do {
            self.photos = try await context.fetch(descriptor)
        } catch {
            print("Failed to fetch EyeBodyPhotos: \(error)")
            await MainActor.run {
                self.photos = []
            }
        }
    }

    func saveOrUpdateEyeBodyPhoto(date: String, images: [UIImage?], context: ModelContext) async {
        if let existingPhoto = photos.first(where: { $0.date == date }) {
            await updateEyeBodyPhoto(existingPhoto, images: images, context: context)
        } else {
            let newPhoto = EyeBodyPhoto(date: date,
                                        frontImage: images[0],
                                        backImage: images[1],
                                        leftImage: images[2],
                                        rightImage: images[3])
            context.insert(newPhoto)
        }
        do {
            try await context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
        await fetchEyeBodyPhotos(context: context)
    }

    func updateEyeBodyPhoto(_ photo: EyeBodyPhoto, images: [UIImage?], context: ModelContext) async {
        await MainActor.run {
            photo.frontImageData = images[0]?.pngData()
            photo.backImageData = images[1]?.pngData()
            photo.leftImageData = images[2]?.pngData()
            photo.rightImageData = images[3]?.pngData()
        }
        do {
            try await context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }

    func deleteEyeBodyPhoto(_ photo: EyeBodyPhoto, context: ModelContext) async {
        context.delete(photo)
        do {
            try await context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
        await fetchEyeBodyPhotos(context: context)
    }
}
