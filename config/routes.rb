Rails.application.routes.draw do
	root 'rpg#index'

	get 'success/farm', to: 'rpg#farm'
	get 'success/cave', to: 'rpg#cave'
	get 'success/house', to: 'rpg#house'
	get 'success/casino', to: 'rpg#casino'
	get 'success/reset', to: 'rpg#reset'
	
end
