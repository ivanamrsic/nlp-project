//
//  NLLanguageExtensions.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 02.01.2021..
//

import Foundation
import NaturalLanguage

extension NLLanguage {

    var localized: String {
        switch self {
        case .amharic: return Strings.localize(eng: "Amharic", cro: "Amharski")
        case .arabic: return Strings.localize(eng: "Arabic", cro: "Arapski")
        case .armenian: return Strings.localize(eng: "Armenian", cro: "Armenski")
        case .bengali: return Strings.localize(eng: "Bengali", cro: "Bengalski")
        case .bulgarian: return Strings.localize(eng: "Bulgarian", cro: "Arapski")
        case .burmese: return Strings.localize(eng: "Burmese", cro: "Burmanski")
        case .catalan: return Strings.localize(eng: "Catalan", cro: "Katalonski")
        case .cherokee: return Strings.localize(eng: "Cherokee", cro: "Cherokee")
        case .croatian: return Strings.localize(eng: "Croatian", cro: "Hrvatski")
        case .czech: return Strings.localize(eng: "Czech", cro: "Ceski")
        case .danish: return Strings.localize(eng: "Danish", cro: "Danski")
        case .dutch: return Strings.localize(eng: "Dutch", cro: "Nizozemski")
        case .english: return Strings.localize(eng: "English", cro: "Engleski")
        case .finnish: return Strings.localize(eng: "Finnish", cro: "Finski")
        case .french: return Strings.localize(eng: "French", cro: "Francuski")
        case .georgian: return Strings.localize(eng: "Georgian", cro: "Gruzijski")
        case .german: return Strings.localize(eng: "German", cro: "Njemacki")
        case .greek: return Strings.localize(eng: "Greek", cro: "Grcki")
        case .gujarati: return Strings.localize(eng: "Gujarati", cro: "Gudžaratski")
        case .hebrew: return Strings.localize(eng: "Hebrew", cro: "Hebrejski")
        case .hindi: return Strings.localize(eng: "Hindi", cro: "Hindski")
        case .hungarian: return Strings.localize(eng: "Hungarian", cro: "Madarski")
        case .icelandic: return Strings.localize(eng: "Icelandic", cro: "Islandski")
        case .indonesian: return Strings.localize(eng: "Indonesian", cro: "Indonezijski")
        case .italian: return Strings.localize(eng: "Italian", cro: "Talijanski")
        case .japanese: return Strings.localize(eng: "Japanese", cro: "Japanski")
        case .kannada: return Strings.localize(eng: "Kannada", cro: "Kannada")
        case .khmer: return Strings.localize(eng: "Khmer", cro: "Khmer")
        case .korean: return Strings.localize(eng: "Korean", cro: "Korejski")
        case .lao: return Strings.localize(eng: "Lao", cro: "Lao")
        case .malay: return Strings.localize(eng: "Malay", cro: "Malajski")
        case .malayalam: return Strings.localize(eng: "Malayalam", cro: "Malajalam")
        case .marathi: return Strings.localize(eng: "Marathi", cro: "Marathski")
        case .mongolian: return Strings.localize(eng: "Mongolian", cro: "Mongolski")
        case .norwegian: return Strings.localize(eng: "Norwegian", cro: "Norveski")
        case .oriya: return Strings.localize(eng: "Oriya", cro: "Orija")
        case .persian: return Strings.localize(eng: "Persian", cro: "Perzijski")
        case .polish: return Strings.localize(eng: "Polish", cro: "Poljski")
        case .portuguese: return Strings.localize(eng: "Portuguese", cro: "Portugalski")
        case .punjabi: return Strings.localize(eng: "Punjabi", cro: "Pandžabi")
        case .romanian: return Strings.localize(eng: "Romanian", cro: "Rumunjski")
        case .russian: return Strings.localize(eng: "Russian", cro: "Ruski")
        case .simplifiedChinese: return Strings.localize(eng: "Simplified Chinese", cro: "Pojednostavljeni Kineski")
        case .sinhalese: return Strings.localize(eng: "Sinhalese", cro: "Sinhaleški")
        case .slovak: return Strings.localize(eng: "Slovak", cro: "Slovački")
        case .spanish: return Strings.localize(eng: "Spanish", cro: "Spanjolski")
        case .swedish: return Strings.localize(eng: "Swedish", cro: "Švedski")
        case .tamil: return Strings.localize(eng: "Tamil", cro: "Tamil")
        case .telugu: return Strings.localize(eng: "Telugu", cro: "Teluški")
        case .thai: return Strings.localize(eng: "Thai", cro: "Tajlandski")
        case .tibetan: return Strings.localize(eng: "Tibetan", cro: "Tibetanski")
        case .traditionalChinese: return Strings.localize(eng: "Traditional Chinese", cro: "Tradicionalni Kineski")
        case .turkish: return Strings.localize(eng: "Turkish", cro: "Turski")
        case .ukrainian: return Strings.localize(eng: "Ukrainian", cro: "Ukrajinski")
        case .undetermined: return Strings.localize(eng: "Undetermined", cro: "Neodređeno")
        case .urdu: return Strings.localize(eng: "Urdu", cro: "Urdu")
        case .vietnamese: return Strings.localize(eng: "Vietnamese", cro: "Vijetnamski")
        default: return Strings.localize(eng: "Unknown language", cro: "Nepoznat jezik")
        }
    }
}
