//
//  Text.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation


enum TextTitles {
	
	enum StartScreenView: String {
		case welcome = "Добро пожаловать"
		case progress = "Отслеживай свой прогресс по чтению и соревнуйся с друзьями!"
		case registration = "Регистрация"
		case account = "Уже есть аккаунт?"
		case entry = "Войти"
		case policy = "Продолжая, вы соглашаетесь с [правилами использования приложения](https://www.apple.com/) и [политикой конфиденциальности](https://www.apple.com/)"
	}
	
	enum RegistrationView: String {
		case email = "E-mail"
		case enterEmail = "Введите электронную почту"
		case password = "Пароль"
		case enterPassword = "Повторите пароль"
		case account = "Уже есть аккаунт?"
		case entry = "Войти"
	}
	
	enum MailConfirmStep1: String {
		case emailConfirm = "Подтвердите адрес электронной почты"
		case sendMail = "Мы отправили письмо на"
		case doNotGetMail = "Не получили письмо?"
		case sendAgain = "Отправить еще раз"
	}
	
	enum MailConfirmStep2: String {
		case emailConfirmed = "Ваш адрес электронной почты подтвержден!"
	}
	
	enum RegOnBoarding1: String {
		case setPhotoText = "Поделись своей фотографией, чтобы друзьям было легче тебя найти. Если сейчас не готов, ты всегда можешь вернуться к этому в настройках своего профиля."
		case skip = "Пропустить"
	}
	
	enum RegOnBoarding2: String {
		case whatToRead = "Что вы любите читать?"
		case chooseGenre = "Выберите как минимум 3 жанра"
	}
	
	enum RegOnBoarding3: String {
		case setGoals = "Хотите настроить сейчас ваши цели по чтению?"
		case skip = "Пропустить"
	}
	
}
