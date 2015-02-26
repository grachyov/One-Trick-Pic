//
//  OTPImageManager.swift
//  One Trick Pic
//
//  Created by Ivan Grachev on 26/02/15.
//  Copyright (c) 2015 Ivan Grachev. All rights reserved.
//

import Foundation
import Photos

class OTPImageManager {
    
    func copyAndDeleteLastImage() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        let fetchResults = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions)
        let lastAsset = fetchResults.lastObject as PHAsset
        let imageDataRequestOptions = PHImageRequestOptions()
        imageDataRequestOptions.version = PHImageRequestOptionsVersion.Current
        PHImageManager.defaultManager().requestImageDataForAsset(lastAsset, options: imageDataRequestOptions) {
            (imageData: NSData!, dataUTI: String!, orientation: UIImageOrientation, info: [NSObject : AnyObject]!) -> Void in
            if !(info[PHImageResultIsDegradedKey] as Bool) && imageData != nil {
                let image = UIImage(data: imageData)
                UIPasteboard.generalPasteboard().image = image
                PHPhotoLibrary.sharedPhotoLibrary().performChanges({PHAssetChangeRequest.deleteAssets([lastAsset])}) {(success: Bool, error: NSError!) -> Void in}
            }
        }
    }
    
}