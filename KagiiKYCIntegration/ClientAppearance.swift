//
//  ClientAppearance.swift
//  KagiiKYCIntegration
//
//  Copyright © 2020 Sedicii Innovations Limited. All rights reserved.
//

import KYCExpert
import UIKit

struct ClientAppearance {

    private init() {}

    static let appearance: KYCAppearance = {
        var appearance = KYCAppearance()

        appearance.contentPalette.main = .white
        appearance.contentPalette.contrastText = .black

        appearance.theme.primary.main = UIColor(asset: Asset.secondary)
        appearance.theme.primary.contrastText = .white
        appearance.theme.secondary.main = UIColor(asset: Asset.secondary)
        appearance.theme.secondary.contrastText = .white

        appearance.header.closeButton.palette = appearance.theme.secondary
        appearance.header.palette = appearance.contentPalette
        appearance.header.subtitle.weight = .light
        appearance.header.title.weight = .bold

        appearance.icons.accreditedInvestor = UIImage(asset: Asset.accreditedInvestor)
        appearance.icons.documentCountry = UIImage(asset: Asset.documentCountry)
        appearance.icons.documentType = UIImage(asset: Asset.documentType)
        appearance.icons.finish = UIImage(asset: Asset.finish)
        appearance.icons.identityDocument = UIImage(asset: Asset.identityDocument)
        appearance.icons.processing = UIImage(asset: Asset.processing)
        appearance.icons.proofOfAddress = UIImage(asset: Asset.proofOfAddress)
        appearance.icons.sourceOfWealth = UIImage(asset: Asset.sourceOfWealth)
        appearance.icons.uploading = UIImage(asset: Asset.uploading)

        appearance.listView.background = appearance.theme.secondary

        appearance.textField.palette.main = .lightGray
        appearance.textField.palette.contrastText = appearance.contentPalette.contrastText

        return appearance
    }()

}
