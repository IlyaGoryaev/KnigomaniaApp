import SwiftUI


struct GenreSelection: View {
	
	private(set) var tags: [String]
	
	private(set) var groupItems: [[String]] = []
	
	private(set) var screenWidth = UIScreen.main.bounds.width
	
	@Binding 
	private(set) var numberOfGenresChosen: Int
	
	
	init(tags: [String], numberOfGenresChosen: Binding<Int>){
		self.tags = tags
		self._numberOfGenresChosen = numberOfGenresChosen
		self.groupItems = createGroupItems(tags)
		
	}
	
	var body: some View{
		VStack(alignment: .leading, spacing: 16){
			ForEach(groupItems, id: \.self){ items in
				HStack{
					ForEach(items, id: \.self){ item in
						ItemView(title: item, numberOfGenresChosen: $numberOfGenresChosen)
					}
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			
		}
	}
	
	private func createGroupItems(_ items: [String]) -> [[String]]{
		
		var groupItems: [[String]] = [[String]]()
		var tempItems: [String] = [String]()
		var width: CGFloat = 0
		for word in items{
			let label = UILabel()
			label.text = word
			label.sizeToFit()
			
			let labelWidth = label.frame.size.width + 64
			if (width + labelWidth + 32) < screenWidth && tempItems.count < 2{
				width += labelWidth
				tempItems.append(word)
			} else {
				width = labelWidth
				groupItems.append(tempItems)
				tempItems.removeAll()
				tempItems.append(word)
				
			}
			
		}
		groupItems.append(tempItems)
		return groupItems
		
	}
	
}
struct UnselectedGenre: ViewModifier{
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16, weight: .regular))
			.frame(height: 40)
			.frame(maxWidth: .infinity)
			.foregroundStyle(CustomColors.brownColor)
			.background(Color.white)
			.clipShape(RoundedRectangle(cornerRadius: 20))
			.overlay {
				RoundedRectangle(cornerRadius: 20)
					.stroke(CustomColors.darkBrownColor, lineWidth: 1)
			}
	}
	
}

struct SelectedGenre: ViewModifier{
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16, weight: .semibold))
			.frame(height: 40)
			.frame(maxWidth: .infinity)
			.foregroundStyle(Color.white)
			.background(CustomColors.brownColor)
			.clipShape(RoundedRectangle(cornerRadius: 20))
	}
	
}

struct ItemView: View{
	
	var title: String
	@Binding var numberOfGenresChosen: Int
	@State var isSelected = false
	
	var body: some View{
		if isSelected{
			withAnimation{
				Text(title)
					.modifier(SelectedGenre())
					.onTapGesture {
						withAnimation{
							isSelected = false
							numberOfGenresChosen -= 1
						}
					}
			}
		} else {
			withAnimation {
				Text(title)
					.modifier(UnselectedGenre())
					.onTapGesture {
						withAnimation {
							isSelected = true
							numberOfGenresChosen += 1
						}
					}
			}
		}
	}
}
