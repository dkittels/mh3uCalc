module EquipmentHelper
	def get_position_name(position)
		position_names = ['Weapon','Helmet','Chest','Arms','Waist','Feet','Talisman']
		return position_names[position]
	end
end
