//
//  TestData.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 01.11.2023.
//

import Foundation

class TestBookPageData {
	
	static var book = BookPageModel(title: "Черное зеркало", author: "Наталья Александрова", year: "2016", grade: 4.1, description: "В конце XIX века особняк купца Клюквина считался одним из самых богатых домов Петербурга. Особую гордость хозяина представляло венецианское зеркало необыкновенной красоты, привезённое из Италии и долгое время украшавшее усыпальницу самого графа Дракулы.", reviews: [], similar: [])
	
	static var reviews = [Review(title: "jdjdjjdjjdj", text: "fuehfhdsiuhiufhdsiuhfiudshiufhdsiuhfiudshiufhsdiuhfiushduhfus fudsoifiosudiofiosd uofidsuiofusdiouiofsdf iodfsuiouofidsuoifsd oiufsdoiufiosdoifsd ufoisduoifusdoiufsd", grade: 5, isLiked: true, likes: 4), Review(title: "jdjdjjdjjdj", text: "fuehfhdsiuhiufhdsiuhfiudshiufhdsiuhfiudshiufhsdiuhfiushduhfus fudsoifiosudiofiosd uofidsuiofusdiouiofsdf iodfsuiouofidsuoifsd oiufsdoiufiosdoifsd ufoisduoifusdoiufsd", grade: 5, isLiked: true, likes: 4), Review(title: "jdjdjjdjjdj", text: "fuehfhdsiuhiufhdsiuhfiudshiufhdsiuhfiudshiufhsdiuhfiushduhfus fudsoifiosudiofiosd uofidsuiofusdiouiofsdf iodfsuiouofidsuoifsd oiufsdoiufiosdoifsd ufoisduoifusdoiufsd", grade: 5, isLiked: true, likes: 4), Review(title: "jdjdjjdjjdj", text: "fuehfhdsiuhiufhdsiuhfiudshiufhdsiuhfiudshiufhsdiuhfiushduhfus fudsoifiosudiofiosd uofidsuiofusdiouiofsdf iodfsuiouofidsuoifsd oiufsdoiufiosdoifsd ufoisduoifusdoiufsd", grade: 5, isLiked: true, likes: 4), Review(title: "jdjdjjdjjdj", text: "fuehfhdsiuhiufhdsiuhfiudshiufhdsiuhfiudshiufhsdiuhfiushduhfus fudsoifiosudiofiosd uofidsuiofusdiouiofsdf iodfsuiouofidsuoifsd oiufsdoiufiosdoifsd ufoisduoifusdoiufsd", grade: 5, isLiked: true, likes: 4)]
	
	static var notifications = [NotificationModel(title: "Книжный вызов", textNotification: "Привет! Твой друг бросил тебе книжный вызов. Принимай вызов, чтобы следить за прогресом!", date: Date().description, isRead: true), NotificationModel(title: "Книжный вызов", textNotification: "Привет!  Мария приняла твой книжный вызов! Теперь ты можешь следить за ее прогрессом в приложении!", date: Date().description, isRead: false), NotificationModel(title: "Рецензия", textNotification: "Анастасия поставил(а) лайк на вашу рецензию по книге «Чёрное зеркало».", date: Date().description, isRead: false), NotificationModel(title: "Рецензия", textNotification: "", date: "Ваша рецензия по книге «Чёрное зеркало» прошла модерацию.", isRead: true), NotificationModel(title: "Обновление приложения", textNotification: "В разделе «Рекомендации» появилась возможность создавать свои списки.", date: Date().description, isRead: true)]
	
}
