import Foundation


enum CurrencyCases: String, CaseIterable {
    case EURUSD = "EUR / USD"
    case GPBUSD = "USD / EUR"
    case AUDEUR = "AUD / EUR"
    case EURAUD = "EUR / AUD"
    case AEDUSD = "AED / USD"
    case USDAED = "USD / AED"
    case CADUSD = "CAD / USD"
    case USDCAD = "USD / CAD"
    
    var url: URL? {
        switch self {
        case .EURUSD, .GPBUSD, .AUDEUR, .EURAUD:
            let url = URL(string: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21&theme=dark")
            return url
        default:
            let url = URL(string: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP&theme=dark")
            return url
        }
    }
}
