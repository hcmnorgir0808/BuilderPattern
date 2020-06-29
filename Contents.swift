import UIKit

//
//　①Product(生成したいオブジェクト)を作成
//　②Builderがインスタンスを作成
//　③DirectorがBuilderを使ってProductを使う役割
//
class Director {
    var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func construct() {
        builder.builderName(name: "Name")
        builder.builderDescription(descirption: "Description")
    }
}

protocol Builder {
    func result() -> Product
    func builderName(name: String)
    func builderDescription(descirption: String)
}

// 生成したいインスタンスの中身
class Product {
    var name: String!
    var description: String!
}

class MyBuilder1: Builder {
    private let product = Product()
    
    func builderName(name: String) {
        product.name = name
    }
    
    func builderDescription(descirption: String) {
        product.description = descirption
    }
    
    func result() -> Product {
        return product
    }
}

// builderを渡してDirectorをインスタンス化
let director1 = Director(builder: MyBuilder1())
// directorからメンバ変数のbuilderを使ってでProductを操作
director1.construct()
// Productの中身を表示
print(director1.builder.result().name)
