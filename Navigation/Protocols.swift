//
//  Protocols.swift
//  Navigation
//
//  Created by antonfrolov on 05.05.2022.
//

import Foundation
import UIKit

protocol TapViewDelegate: AnyObject {
    func postImagePressed (postViewDelegate: PostViewDelegate)
}

protocol PostViewDelegate: AnyObject {
    func postLikePressed ()
    var post: Post {get set}
}

protocol TapPhotoDelegate: AnyObject {
    func photoPressed(photoView: UIImageView)
}

