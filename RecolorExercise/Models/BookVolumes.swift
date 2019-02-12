//
//  BookVolumes.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import Foundation

struct BookVolumes: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

struct Item: Codable {
    let kind: String
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let layerInfo: LayerInfo?
}

struct AccessInfo: Codable {
    let country: String
    let viewability: String
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: String
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: String
    let quoteSharingAllowed: Bool
}

struct Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?
}

struct LayerInfo: Codable {
    let layers: [Layer]
}

struct Layer: Codable {
    let layerID, volumeAnnotationsVersion: String
    
    enum CodingKeys: String, CodingKey {
        case layerID = "layerId"
        case volumeAnnotationsVersion
    }
}

struct SaleInfo: Codable {
    let country: String
    let saleability: String
    let isEbook: Bool
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}

struct SaleInfoListPrice: Codable {
    let amount: Double
    let currencyCode: String
}

struct Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice
}

struct OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: String
}

struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let publisher: String?
    let publishedDate: String
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int?
    let printType: String
    let categories: [String]
    let maturityRating: String
    let allowAnonLogging: Bool
    let contentVersion: String
    let imageLinks: ImageLinks
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let panelizationSummary: PanelizationSummary?
    let averageRating: Double?
    let ratingsCount: Int?
    let subtitle: String?
}

struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

struct IndustryIdentifier: Codable {
    let type: String
    let identifier: String
}

struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

struct ReadingModes: Codable {
    let text, image: Bool
}
