
import UIKit

struct Story : Identifiable {
    var id : Int
    var image : String
    var offset : CGFloat
    var title : String
    var date : String
    var location : String
}

func getList() -> [Story] {
    return [
        Story(id: 0, image: "image1", offset: 0,title: "Fashion Talk", date: "Nov 14, 2021", location: "Mumbai, India"),
        Story(id: 1, image: "image2", offset: 0,title: "Avenger Games", date: "Nov 14, 2021", location: "Mumbai, India"),
        Story(id: 2, image: "image3", offset: 0,title: "Marvel Show", date: "Nov 14, 2021", location: "Mumbai, India"),
    ]
}
