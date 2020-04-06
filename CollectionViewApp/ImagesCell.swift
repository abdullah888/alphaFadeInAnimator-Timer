//
//  ImagesCell.swift
//  CollectionViewApp
//
//  Created by abdullah on 13/08/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//

import UIKit

class ImagesCell: UICollectionViewCell {
    
    static let fadeTime = 3.0

    var alphaFadeInAnimator: UIViewPropertyAnimator?
    var betaFadeInAnimator: UIViewPropertyAnimator?

    @IBOutlet weak var ImageView: UIImageView!
    
    
    func Update(Image : UIImage) {
           self.ImageView.image = Image
      ImageView.contentMode = .scaleAspectFill
        startAnimations()

       }
    
    
    private func startAnimations()
        {
          ImageView.alpha = 0.0
            ImageView.alpha = 1.0
            alphaFadeInAnimator = UIViewPropertyAnimator(duration: ViewController.fadeTime, curve: .easeOut)
            {
                self.ImageView.alpha = 1.0
                self.ImageView.alpha = 0.0
            }
            betaFadeInAnimator = UIViewPropertyAnimator(duration: ViewController.fadeTime, curve: .easeOut)
            {
                self.ImageView.alpha = 0.0
                self.ImageView.alpha = 1.0
            }
            if let alphaAnimator = self.alphaFadeInAnimator, let betaAnimator = self.betaFadeInAnimator
            {
                alphaAnimator.addCompletion
                {
                    position in
                    betaAnimator.startAnimation()
                }
                betaAnimator.addCompletion
                {
                    position in
                    self.startAnimations()
                }
                alphaFadeInAnimator!.startAnimation()
            }
        }
    }


    
    

