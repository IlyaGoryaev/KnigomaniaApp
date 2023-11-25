import Foundation

enum Genre: String{
	
	case fantasy = "Фантастика"
	case novels = "Романы"
	case nonfiction = "Документальная литература"
	case psychology = "Психология"
	case business = "Бизнес"
	case detective = "Детектив"
	case prose = "Проза"
	case artisticLiterature = "Художественная литература"
	case IT = "IT"
	case philosophy = "Философия"
	case naturalSciences = "Естественные науки"
	case health = "Медицина, здоровье"
	case youngAdult = "Young Adult"
	case biography = "Биография"
	case art = "Искусство"
	case jurisprudence = "Юриспруденция, право"
	case cooking = "Кулинария"
	case sport = "Спорт"
	case journeys = "Путешествия"
	
	static var allValues: [String] = [fantasy.rawValue, novels.rawValue, nonfiction.rawValue, psychology.rawValue, business.rawValue, detective.rawValue, prose.rawValue, artisticLiterature.rawValue, philosophy.rawValue, IT.rawValue, naturalSciences.rawValue, health.rawValue, youngAdult.rawValue, biography.rawValue, art.rawValue, jurisprudence.rawValue, cooking.rawValue, sport.rawValue, journeys.rawValue]
	
	
}
