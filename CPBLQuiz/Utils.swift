//
//  Utils.swift
//  CPBLQuiz
//
//  Created by Nick Lu on 2023/12/21.
//

import UIKit

class Utils {
    func setButtonStyle(button: UIButton) {
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "buttonBackground")
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor(named: "buttonShadow")?.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor(named: "buttonBorder")?.cgColor
    }
    
    func addBackground(backgroundName: String) -> UIImageView{
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: backgroundName)
        imageViewBackground.alpha = 0.5

        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        return imageViewBackground
    }
    
    func setupPlayersQuestions() -> [Question] {
        var questions = [
            Question(question: "在中職的比賽，如果發生失誤又稱為什麼？",
                     options: ["煮粥", "吃鍋貼", "魯閣", "炸裂"].shuffled(),
                     correctAnswer: "煮粥",
                     description: "「煮粥」一詞起源於主播錢定遠 於播報時說出了「亂成一鍋粥」，之後各隊球員守備發生失誤時 衍生為「煮粥」。",
                     category: .cpbl),
            Question(question: "在中職的比賽，如果打者打出全壘打又稱為什麼？",
                     options: ["煮粥", "吃鍋貼", "魯閣", "炸裂"].shuffled(),
                     correctAnswer: "炸裂",
                     description: "最初是日本近鐵牛隊的應援團在大約2000~2001年左右，在強打者中村紀洋打擊時時， 常會舉起「驚彈炸裂」的應援標語，後來該用語被緯來的棒球主播徐展元所引用，並在陳金鋒打出全壘打時，常會使用特有的用語「鋒炮炸裂」。後來在ptt棒球版也開始流行使用該詞。",
                     category: .cpbl),
            Question(question: "下列哪個棒球場是中信兄弟的主場？",
                     options: ["樂天桃園棒球場", "台南棒球場", "台中洲際棒球場", "天母棒球場"].shuffled(),
                     correctAnswer: "台中洲際棒球場",
                     description: "",
                     category: .brothers),
            Question(question: "2014年中信兄弟接手後，共拿了幾次亞軍？",
                     options: ["5次", "6次", "7次", "8次"].shuffled(),
                     correctAnswer: "6次",
                     description: "中信兄弟接手後，分別於2014, 2015, 2016, 2017, 2019, 2020年度，獲得6次亞軍",
                     category: .brothers),
            Question(question: "2023年自由球員市場，陳俊秀被哪一個球隊簽下？",
                     options: ["台鋼雄鷹", "中信兄弟", "統一獅", "富邦悍將"].shuffled(),
                     correctAnswer: "中信兄弟",
                     description: "2023年底，中信兄弟與陳俊秀簽下3年合約，總值超過3000萬，第一年月薪75萬，後2年逐步往上提升，為中華職棒第四位FA成功的球員。",
                     category: .brothers),
            Question(question: "統一獅選手陳傑憲的綽號？",
                     options: ["三爺", "四爺", "七爺", "八爺"].shuffled(),
                     correctAnswer: "四爺",
                     description: "因外貌神似演員吳奇隆，故有「四爺」的外號。",
                     category: .unilions),
            Question(question: "下列選手哪個不是「外野三鬼」的成員？",
                     options: ["邱智呈", "陳傑憲", "林安可", "蘇智傑"].shuffled(),
                     correctAnswer: "邱智呈",
                     description: "「外野三鬼」成員為蘇智傑、陳傑憲、林安可。",
                     category: .unilions),
            Question(question: "截至2023年度球季，潘威倫選手目前生涯累積多少勝投？",
                     options: ["147", "148", "149", "150"].shuffled(),
                     correctAnswer: "148",
                     description: "",
                     category: .unilions),
            Question(question: "富邦悍將第一位背號引退的選手？",
                     options: ["羅力", "高國輝", "詹智堯", "林琨笙"].shuffled(),
                     correctAnswer: "羅力",
                     description: "2023年5月27、28日，富邦悍將舉辦「L39END」主題日，羅力行使本土洋將權利，擔任先發投手投一打席，並引退39背號。",
                     category: .guardians),
            Question(question: "以下何者不是富邦悍將的年度口號？",
                     options: ["We will", "湛藍出擊", "Fight On", "強悍出擊"].shuffled(),
                     correctAnswer: "強悍出擊",
                     description: "強悍出擊是富邦悍將的嗆司曲名稱，非年度口號。",
                     category: .guardians),
            Question(question: "以下何者不是富邦悍將選秀第一輪選手？",
                     options: ["江少慶", "張進德", "王念好", "郭俊麟"].shuffled(),
                     correctAnswer: "郭俊麟",
                     description: "郭俊麟選手為2020年第二輪被富邦悍將球團選進。",
                     category: .guardians),
            Question(question: "味全龍相隔幾年再度拿下中華職棒總冠軍？",
                     options: ["21", "22", "23", "24"].shuffled(),
                     correctAnswer: "24",
                     description: "味全龍於2023年度總冠軍賽擊敗樂天桃猿，奪下隊史第5座總冠軍，睽違24年再度奪冠，也是復隊之後首冠。",
                     category: .dragons),
            Question(question: "味全龍選手林智勝是在哪個棒球場達成300轟？",
                     options: ["台中洲際棒球場", "樂天桃園棒球場", "天母棒球場", "台南棒球場"].shuffled(),
                     correctAnswer: "樂天桃園棒球場",
                     description: "2023年4月16日例行賽，在第8局上半代打面對桃猿救援投手豪勁（Bradin Hagens），打出左外野方向3分打點全壘打，是本季第1轟，更是中職生涯第300轟，成為中職史上第1位達成此紀錄的選手。",
                     category: .dragons),
            Question(question: "味全龍選手徐若熙曾創下連續幾次三振次數？",
                     options: ["11次", "12次", "13次", "14次"].shuffled(),
                     correctAnswer: "11次",
                     description: "2021年3月17日，中職生涯一軍初登板，先發主投3.2局，繳出11次三振、被打3支安打、1次觸身球保送，無失分，最快球速154km/h，也因此締造新人初登板史無前例的三振紀錄。",
                     category: .dragons),
            Question(question: "下列選手哪個不是台鋼雄鷹在2023年用林子偉交易到的選手？",
                     options: ["藍寅倫", "王溢正", "許峻暘", "翁瑋均"].shuffled(),
                     correctAnswer: "許峻暘",
                     description: "許峻暘選手為台鋼雄鷹第二次擴編選秀選進的選手。",
                     category: .hawks),
            Question(question: "台鋼雄鷹創隊的第一位選手是？",
                     options: ["紀慶然", "曾子祐", "黃劼希", "葉保弟"].shuffled(),
                     correctAnswer: "曾子祐",
                     description: "曾子祐選手為台鋼雄鷹隊史的選秀狀元，也是隊史第一名簽約選手。",
                     category: .hawks),
            Question(question: "台鋼雄鷹創隊日期為？",
                     options: ["2022年4月25日", "2022年4月26日", "2022年4月27日", "2022年4月28日"].shuffled(),
                     correctAnswer: "2022年4月27日",
                     description: "2022年4月27日，中職舉行常務理事會，針對台鋼雄鷹成為第六隊議題進行審查與投票，最後全票通過，台鋼雄鷹確定正式成為中職第六隊，主色系將為綠色。",
                     category: .hawks)]
        return questions
    }
    
    func setupGirlsQuestions()  -> [Question] {
        var questions = [
            Question(question: "某位前中職啦啦隊團員和藝人李國毅結婚， 這位啦啦隊團員之前所屬的隊伍是?",
                     options: ["Passion Sisters", "Dragons Beauties", "Uni Girls", "Fubon Angels"].shuffled(),
                     correctAnswer: "Uni Girls",
                     description: "李國毅的老婆為曾是中職統一獅Uni Girls的啦啦隊成員「橘子」，目前是名小有名氣的專業舞者。",
                     category: .ug),
            Question(question: "出生在棒球世家，父親和哥哥都是棒球員的啦啦隊成員是？",
                     options: ["艾璐", "卡卡", "貴貴", "瑟七"].shuffled(),
                     correctAnswer: "艾璐",
                     description: "父親為前中華職棒三商虎隊投手、名青棒教練李杜宏，哥哥為前日本職棒千葉羅德海洋隊野手李杜軒。",
                     category: .ug),
            Question(question: "目前啦啦隊成員數量最多的那支球隊是？",
                     options: ["Passion Sisters", "Rakuten Girls", "Fubon Angels", "Uni Girls"].shuffled(),
                     correctAnswer: "Rakuten Girls",
                     description: "2023年 Rakuten Girls 成員人數來到33人，是史上最多。",
                     category: .rkg),
            Question(question: "下列哪一位啦啦隊成員改名次數最多？",
                     options: ["艾璐", "語芯", "纁曖", "沐妍"].shuffled(),
                     correctAnswer: "纁曖",
                     description: "總共改過三次名，寶兒->宣琳->纁曖->羚安(離開職棒啦啦隊後改名)",
                     category: .rkg),
            Question(question: "Dragons Beauties 小映因為和哪位政治人物撞臉而出名？",
                     options: ["高嘉瑜", "黃捷", "徐巧芯", "高虹安"].shuffled(),
                     correctAnswer: "高嘉瑜",
                     description: "",
                     category: .db),
            Question(question: "以下哪一位女孩不是2023年 Dragons Beauties 練習生？",
                     options: ["小珍奶", "詩雅", "寧寧", "小迪"].shuffled(),
                     correctAnswer: "小迪",
                     description: "小迪為2023年 Passion Sisters 練習生。",
                     category: .db),
            Question(question: "下列哪一位啦啦隊成員都待在同一個啦啦隊沒有轉隊過？",
                     options: ["貴貴", "妮可", "心璇", "YURI"].shuffled(),
                     correctAnswer: "貴貴",
                     description: "妮可(Unigirls->Passion Sisters)\r\n心璇(Unigirls->Dragons Beauties)\r\nYURI(Unigirls->Rakuten Girls)",
                     category: .ps),
            Question(question: "陳子豪應援曲是因為哪位啦啦隊女孩而爆紅？",
                     options: ["短今", "林可", "峮峮", "貴貴"].shuffled(),
                     correctAnswer: "峮峮",
                     description: "",
                     category: .ps),
            Question(question: "台鋼雄鷹啦啦隊 Wings Stars 邀請韓國籍的哪位女孩擔任啦啦隊的培訓教練？",
                     options: ["李多慧", "安芝儇", "李皓禎", "朴騏良"].shuffled(),
                     correctAnswer: "安芝儇",
                     description: "",
                     category: .ws),
            Question(question: "2023年台鋼雄鷹啦啦隊 Wings Stars 徵選總共錄取幾位成員？",
                     options: ["11", "12", "13", "14"].shuffled(),
                     correctAnswer: "13",
                     description: "2023年12月9日下午正式宣布，歷經三個多月的一連串培訓以及篩選，最後總計有13位成員通過最終選拔成為台鋼雄鷹啦啦隊的一員，而台鋼集團宣告Wing Stars啦啦隊成軍後的下一步計劃，將在2024年1月份前往南韓進行海外培訓，並於回國後以完整樣貌正式與球迷朋友們見面。",
                     category: .ws),
            Question(question: "Fubon Angels 哪位成員的背號只有一個數字？",
                     options: ["慈妹", "秀秀子", "丹丹", "奶昔"].shuffled(),
                     correctAnswer: "奶昔",
                     description: "奶昔(6)\r\n丹丹(15)\r\n秀秀子(24)\r\n慈妹(37)",
                     category: .fa),
            Question(question: "Fubon Angels 的首場公演名稱叫？",
                     options: ["Volume Up!", "Rise Up", "Fight On", "Touchdown"].shuffled(),
                     correctAnswer: "Volume Up!",
                     description: "",
                     category: .fa)]
        return questions
    }
}
