//
//  NDFirestoreDatabase.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 27.02.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


final class NDFirestoreDatabase {
    
    private let firebaseDb = Firestore.firestore()
    static let shared : NDFirestoreDatabase = NDFirestoreDatabase()
    
    public var currentUserID: String = ""
    
    enum CollectionType:String {
        case users = "users"
        case posts = "posts"
    }
    
//    private let postCollection = "posts"
    
    private init() {}
    
    func addDataToFireBase<T: Codable>(with collectionType: CollectionType, usingDataModel model: T) -> Bool {
        
        switch collectionType {
            
        case .users:
            do {
                let ref = try firebaseDb.collection("\(collectionType.rawValue)").addDocument(from: model)
                self.currentUserID = ref.documentID
                print("Add doc succeded with id = \(ref.documentID)")
            } catch let error {
                print("Add doc failed: \(error)")
                return false
            }
            return true
        case .posts:
            do {
                let ref = try firebaseDb.collection("\(collectionType.rawValue)").addDocument(from: model)
                print("Add doc succeded with id = \(ref.documentID)")
            } catch let error {
                print("Add doc failed: \(error)")
                return false
            }
            return true
        }
                


    }
    
//    func update(usingPost post: NDPostModel) {
//
//        firebaseDb
//            .collection(postCollection)
//            .whereField("id", isEqualTo: post.id)
//            .getDocuments { snapshot, error in
//
//                if let error = error {
//                    print("Document error: \(error)")
//                } else {
//                    if let document = snapshot?.documents.first {
//
//                        do {
//                            try document.reference.setData(from: post)
//                        } catch let error {
//                            print("Document read error: \(error)")
//                        }
//                    }
//                }
//            }
//    }
    
//    func delete(usingID id: String) {
//        
//        firebaseDb
//            .collection(postCollection)
//            .whereField("id", isEqualTo: id)
//            .getDocuments { snapshot, error in
//                
//                if let error = error {
//                    print("Document error: \(error)")
//                } else {
//                    if let document = snapshot?.documents.first {
//                        
//                        document.reference.delete { error in
//                            print("Delete failed: \(String(describing: error))")
//                        }
//                    }
//                }
//            }
//    }
    
    func getData() -> String {
        
        var text = ""
        
        firebaseDb.collection("users").document(self.currentUserID).getDocument(as: NDUserModel.self) { result in
            switch result {
            case .success(let success):
                print(success.nickName)
                text = success.nickName
            case .failure(let failure):
                print(failure)
            }
        }
        return text
    }
    
    func subscribe(completion: @escaping (String) -> Void){
        firebaseDb
            .collection("users")
            .document(self.currentUserID)
            .addSnapshotListener { snapshot, error in
                
//                guard let doc = snapshot else { return }
//                doc.
                
                do {
                    guard let doc = try snapshot?.data(as: NDUserModel.self) else {return}
                    completion(doc.nickName)
                } catch {
                    print(error)
                }
            }
//            .addSnapshotListener { (snapshot, error) in
//
//                guard let collection = snapshot else { return }
//
//                collection.documentChanges.forEach { (change) in
//
//                    do {
//                        if change.type == .added,
//                           let item = try change.document.data(as: NDUserModel.self) {
////                            completion(item)
//                        }
//                    } catch let error {
//                       print("Fetch failure: \(error)")
//                    }
//                }
//            }
    }
}
