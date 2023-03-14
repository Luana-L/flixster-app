//
//  Movie.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

struct MoviesResponse: Decodable {
    let dates: MovieDates
    let page: Int
    let results: [Movie]
}

struct MovieDates: Decodable {
    let maximum: String
    let minimum: String
}

struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: String
    
    //detail properties
    let backdrop_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    
}

extension Movie {
    
    /*
    static var mockMovies: [Movie]  = [
        Movie(movieName: "Black Panther: Wakanda Forever",
              movieDescription: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!,
              voteAvg: 7.4,
              voteCount: 3783,
              popularity: 2949.117),
        Movie(movieName: "Puss in Boots: The Last Wish",
              movieDescription: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg")!,
              voteAvg: 8.4,
              voteCount: 4235,
              popularity: 2820.651),
        Movie(movieName: "M3GAN",
              movieDescription: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg")!,
              voteAvg: 7.5,
              voteCount: 1864,
              popularity: 1420.255),
        Movie(movieName: "Ant-Man and the Wasp: Quantumania",
              movieDescription: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/3JSoB7eMbCd8sE8alxNiUtrNiTz.jpg")!,
              voteAvg: 6.5,
              voteCount: 856,
              popularity: 1109.314),
        Movie(movieName: "A Man Called Otto",
              movieDescription: "When a lively young family moves in next door, grumpy widower Otto Anderson meets his match in a quick-witted, pregnant woman named Marisol, leading to an unlikely friendship that turns his world upside down.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/130H1gap9lFfiTF9iDrqNIkFvC9.jpg")!,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/v2LilmCylr3bL9TCZSj6syjowZh.jpg")!,
              voteAvg: 7.8,
              voteCount: 420,
              popularity: 788.46)
    ]
     */
}
