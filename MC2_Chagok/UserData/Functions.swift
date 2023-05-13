//
//  Functions.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import Foundation
import SwiftUI
import Photos

// MARK: D-day 계산

class Calculate {
    
    /// startDate와 goalDate를 받아서 Dday를 만들어 주는 함수를 선언합니다.
    static func Dday(from startDate: Date = Date(), to goalDate: Date) -> Int {
        
        /// Calendar 를 사용하여 날짜를 계산합니다.
        let dateDifference = Calendar.current.dateComponents([.day], from: startDate, to: goalDate)

        /// 옵셔널 채이닝 : 값이 없을 경우 옵셔널 형태의 0을 반환합니다.
        /// 하지만 함수 자체가 Int 값을 반환하므로 결국 Int가 나오게 됩니다.
        return dateDifference.day ?? 0
    }
}

// MARK: Postbox Image 변경

func postboxImageName(userData: UserData, goalMoney: Int) -> Image {
    var postboxImageName = "Postbox0-20"
    let percent = goalMoney > 0 ? max(min(Double(userData.total) / Double(goalMoney) * 100, 100), 0) : 0
    
    switch percent {
    case 0..<20:
        postboxImageName = "Postbox0-20"
    case 20..<40:
        postboxImageName = "Postbox20-40"
    case 40..<60:
        postboxImageName = "Postbox40-60"
    case 60..<80:
        postboxImageName = "Postbox60-80"
    case 80...100:
        postboxImageName = "Postbox80-100"
    default:
        break
    }
    return Image(postboxImageName)
}

func postboxVideo(userData: UserData, goalMoney: Int) -> String {
    var postboxVideo = "hello world"
    let percent = goalMoney > 0 ? max(min(Double(userData.total) / Double(goalMoney) * 100, 100), 0) : 0
    
    switch percent {
    case 0..<20:
        postboxVideo = "1"
    case 20..<40:
        postboxVideo = "2"
    case 40..<60:
        postboxVideo = "3"
    case 60..<80:
        postboxVideo = "4"
    case 80...100:
        postboxVideo = "5"
    default:
        break
    }
    return postboxVideo
}

// MARK: KoreanNumber Converter

func koreanNumber(_ number: Int) -> String {
    let koreanNumbers = ["", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    
    if number < 1 || number > 9 {
        return "숫자를 추가해주세요"
    }
    
    return koreanNumbers[number-1]
}

func LongkoreanNumber(_ number: Int) -> String {
    let koreanNumbers = ["한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉"]
    
    if number < 1 || number > 9 {
        return "숫자를 추가해주세요"
    }
    
    return koreanNumbers[number-1]
}

// MARK: SaveImage

func saveImage(folderName: String, image: UIImage, fileName: String) {
    guard let data = image.jpegData(compressionQuality: 1) else {
        return // Failed to convert image to data
    }

    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let folder = filePath.appendingPathComponent(folderName)
    let fileURL = folder.appendingPathComponent(fileName+".jpg")

    do {
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: false, attributes: nil)
    } catch let e {
        print(e.localizedDescription)
    }
    
    do {
        try data.write(to: fileURL)
        print("Image saved successfully")
    } catch {
        print("Failed to save image:", error.localizedDescription)
    }
}

// MARK: Image to Album

func createAlbum(albumName: String) {
    PHPhotoLibrary.shared().performChanges ({
        PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
    }, completionHandler: {
        success, error in
        if success {
            print("Album created")
        } else if let error = error {
            print("Error creating album: \(error.localizedDescription)")
        }
    })
}

func exportToAlbum(image: UIImage, albumName: String) {
    
    let fetchOptions = PHFetchOptions()
    fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
    let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
    
    guard let album = collection.firstObject else {
        print("Album not found")
        return
    }
    
    //    guard let image = image else {return}
    
    PHPhotoLibrary.shared().performChanges({
        let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
        let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
        let albumChangeRequest = PHAssetCollectionChangeRequest(for: album)
        albumChangeRequest?.addAssets([assetPlaceholder!] as NSFastEnumeration)
    }, completionHandler: { success, error in
        if success {
            print("Image saved to album")
        }
        else if let error = error {
            print("Error saving image: \(error.localizedDescription)")
        }
    })
    
}

func checkPhotoLibraryAuthorization(completion: @escaping () -> Void) {
    let status = PHPhotoLibrary.authorizationStatus()
    
    switch status {
    case .authorized:
        completion()
    case .denied, .restricted:
        print("Access to photo library denied or restricted")
    case .notDetermined:
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                completion()
            } else {
                print("Access to photo library denied")
            }
        }
    default:
        print("Unknown authorization status")
    }
}


func openMoneyReward(column: Int, row: Int, usertotal: Int) -> String {
    
    let goal = ((column + 1 + row * 3)*(column + 1 + row * 3 - 1) / 2 + 1)
    
    if usertotal >= goal * 1000000 {
        return "Library\(goal)00"
    } else {
        return "LockImage"
    }
}

func openGoalReward(column: Int, row: Int, user: Int) -> String {
    let goal = ((column + 1 + row * 3)*(column + 1 + row * 3 - 1) / 2 + 1)
    
    if user >= goal {
        return "Library\(goal)"
    } else {
        return "LockImage"
    }
}
