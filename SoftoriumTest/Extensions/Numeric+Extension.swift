import SwiftUI

extension Numeric {
    
    func formatted(with groupingSeparator: String? = nil, style: NumberFormatter.Style, locale: Locale = .current) -> String {
            Formatter.number.locale = locale
            Formatter.number.numberStyle = style
            if let groupingSeparator = groupingSeparator {
                Formatter.number.groupingSeparator = groupingSeparator
            }
            return Formatter.number.string(for: self) ?? ""
        }
    
    var currency: String { formatted(style: .decimal, locale: .englishUS) }
}
