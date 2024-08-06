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

    func saveOrUpdateLevelRecord(routineId: Int, levelId: Int, schoolName: String, apiGrade: Int, image: UIImage, context: ModelContext) {
        guard let educationLevel = EducationLevel(rawValue: schoolName) else {
            print("Invalid education level: schoolName = \(schoolName)")
            return
        }

        guard let gradeEnum = convertToGradeEnum(apiGrade: apiGrade, educationLevel: educationLevel) else {
            print("Invalid grade: apiGrade = \(apiGrade), educationLevel = \(educationLevel)")
            return
        }

        if let existingAlbum = albums.first(where: { $0.educationLevel == educationLevel && $0.grade == gradeEnum }),
           let existingRecordIndex = existingAlbum.levelRecords?.firstIndex(where: { $0.levelId == levelId }) {
            updateLevelRecord(existingAlbum.levelRecords![existingRecordIndex], image: image, context: context)
        } else {
            let newRecord = LevelRecordData(routineId: routineId, levelId: levelId, schoolName: schoolName, grade: apiGrade, imageData: image)
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

extension AlbumViewModel {
    func convertToGradeEnum(apiGrade: Int, educationLevel: EducationLevel) -> Grade? {
        switch educationLevel {
        case .kindergarten:
            return Grade(rawValue: apiGrade)
        case .elementary:
            return Grade(rawValue: apiGrade + 10)
        case .middleSchool:
            return Grade(rawValue: apiGrade + 20)
        case .highSchool:
            return Grade(rawValue: apiGrade + 30)
        case .university:
            return Grade(rawValue: apiGrade + 40)
        }
    }
}
