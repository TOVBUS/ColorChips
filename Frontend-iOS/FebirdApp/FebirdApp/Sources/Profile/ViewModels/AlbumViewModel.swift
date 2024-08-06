//
//  AlbumViewModel.swift
//  FebirdApp
//
//  Created by 김혜수 on 8/7/24.
//

import SwiftUI
import SwiftData

@MainActor
class AlbumViewModel: ObservableObject {
    @Published var albums: [AlbumData] = []

    func fetchAlbums(context: ModelContext) {
        let descriptor = FetchDescriptor<LevelRecordData>(sortBy: [SortDescriptor(\.levelId)])
        do {
            let levelRecords = try context.fetch(descriptor)
            createAlbums(with: levelRecords)
        } catch {
            print("Failed to fetch LevelRecordData: \(error)")
            albums = []
        }
    }

    private func createAlbums(with levelRecords: [LevelRecordData]) {
        var newAlbums: [AlbumData] = []
        for level in EducationLevel.allCases {
            for grade in Grade.gradesFor(level) {
                let filteredRecords = levelRecords.filter { record in
                    record.schoolName == level.rawValue && record.grade == grade.rawValue
                }
                let album = AlbumData(
                    educationLevel: level,
                    grade: grade,
                    levelRecords: filteredRecords.isEmpty ? nil : filteredRecords
                )
                newAlbums.append(album)
            }
        }
        self.albums = newAlbums
    }

    func saveOrUpdateLevelRecord(routineId: Int, levelId: Int, schoolName: String, grade: Int, image: UIImage, context: ModelContext) {
        let educationLevel = EducationLevel(rawValue: schoolName)
        let gradeEnum = Grade(rawValue: grade)

        guard let educationLevel = educationLevel, let gradeEnum = gradeEnum else {
            print("Invalid education level or grade: schoolName = \(schoolName), grade = \(grade)")
            return
        }

        if let existingAlbum = albums.first(where: { $0.educationLevel == educationLevel && $0.grade == gradeEnum }),
           let existingRecordIndex = existingAlbum.levelRecords?.firstIndex(where: { $0.levelId == levelId }) {
            updateLevelRecord(existingAlbum.levelRecords![existingRecordIndex], image: image, context: context)
        } else {
            let newRecord = LevelRecordData(routineId: routineId, levelId: levelId, schoolName: schoolName, grade: grade, imageData: image)
            context.insert(newRecord)

            if let index = albums.firstIndex(where: { $0.educationLevel == educationLevel && $0.grade == gradeEnum }) {
                albums[index].levelRecords = (albums[index].levelRecords ?? []) + [newRecord]
            }
        }

        try? context.save()
        fetchAlbums(context: context)
    }

    private func updateLevelRecord(_ record: LevelRecordData, image: UIImage, context: ModelContext) {
        record.imageData = image.pngData()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        record.savedDate = dateFormatter.string(from: Date())
    }

    func getAllAlbums() -> [AlbumData] {
        return albums
    }
}
