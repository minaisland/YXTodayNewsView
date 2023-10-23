//
//  FakeryHelper.swift
//  YXTodayNewsViewDemo
//
//  Created by みなみ on 2023/10/23.
//

import Foundation
import Fakery

@objc
class FakeryHelper: NSObject {
    
    @objc
    static let shared = FakeryHelper(locale: "zh-CN")
    
    let faker: Faker
    
    @objc
    public var fuckingData: String {
        faker.zelda.game()
    }
    
    @objc
    public var catBreed: String {
        faker.cat.breed()
    }
    
    @objc
    public var catRregistry: String {
        faker.cat.registry()
    }
    
    @objc
    public var companyName: String {
        faker.company.name()
    }
    
    @objc
    public var companyLogo: String {
        faker.company.logo()
    }
    
    @objc
    public var internetUsername: String {
        faker.internet.username()
    }
    
    @objc
    public var internetUrl: String {
        faker.internet.url()
    }
    
    @objc
    public var image: String {
        return "https://loremflickr.com/320/200#\(Date().timeIntervalSince1970)"
    }
    
    @objc
    public var imageArray: Array<String> {
        let count = Int.random(in: 4..<8)
        var arr = [String]()
        for _ in 0 ... count {
            arr.append(self.image)
        }
        return arr
    }
    
    @objc
    public var menuItemArray: Array<MenuItemModel> {
        let count = Int.random(in: 4..<8)
        var arr = [MenuItemModel]()
        for _ in 0 ... count {
            let model = MenuItemModel()
            model.imageUrl = self.image
            arr.append(model)
        }
        return arr
    }
    
    @objc
    public var internetTemplateImage: String {
        faker.internet.templateImage()
    }
    
    @objc
    public var name: String {
        faker.name.name()
    }
    
    init(locale: String) {
        faker = Faker(locale: locale)
        super.init()
    }
    
    @objc
    func imageUrl(width: Int = 320, height: Int = 200) -> String {
      return "https://loremflickr.com/\(width)/\(height)"
    }
    
}
