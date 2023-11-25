import Foundation

// MARK: - TraderData

struct TraderData: Identifiable, Hashable {
    let id = UUID()
    let country: String
    let name: String
    let deposit: Int
    let profit: Int
    
    init(country: String, name: String, deposit: Int, profit: Int = 50) {
        self.country = country
        self.name = name
        self.deposit = deposit
        self.profit = profit
    }
    
    static func tradersMockList() -> [TraderData] {
        let l: [TraderData] = [.init(country: "afghanistan", name: "Ali", deposit: 2322),
                               .init(country: "andorra", name: "Garry", deposit: 900),
                               .init(country: "armenia", name: "Robert", deposit: 1500),
                               .init(country: "austria", name: "Gans", deposit: 2000),
                               .init(country: "bosnia-and-herzegovina", name: "Harry", deposit: 2100),
                               .init(country: "botswana", name: "Harry", deposit: 3452),
                               .init(country: "brunei", name: "Sara", deposit: 3300),
                               .init(country: "cameroon", name: "Sam", deposit: 3400),
                               .init(country: "chile", name: "Mario", deposit: 4500),
                               .init(country: "england", name: "John", deposit: 4670),
                               .init(country: "finland", name: "Elf", deposit: 4764),
                               .init(country: "france", name: "Emma", deposit: 2422),
                               .init(country: "guinea", name: "Kate", deposit: 5634),
                               .init(country: "hawaii", name: "John", deposit: 5500),
                               .init(country: "ireland", name: "Jimmy", deposit: 6000),
                               .init(country: "laos", name: "Steve", deposit: 4567),
                               .init(country: "mauritius", name: "Jim", deposit: 4400),
                               .init(country: "myanmar", name: "Stene", deposit: 3440),
                               .init(country: "panama", name: "Pavel", deposit: 1240),
                               .init(country: "romania", name: "Stella", deposit: 1900),
                               .init(country: "saudi-arabia", name: "Ali", deposit: 5500),
                               .init(country: "sri-lanka", name: "Rama", deposit: 8600),
                               .init(country: "switzerland", name: "Gans", deposit: 6900),
                               .init(country: "unitedstates", name: "John", deposit: 7700),
                               .init(country: "vatican-city", name: "Rome", deposit: 7540)
        ]
        return l
    }
}
