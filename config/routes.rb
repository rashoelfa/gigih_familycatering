Rails.application.routes.draw do
 get "/menu", to: "menu#show_all_menu_items"
 get "/category", to: "menu#show_all_categories"
 post "/menu/create", to: "menu#create_menu_item"
 post "/menu/create/category", to: "menu#create_item_category"
 put "/menu/update", to: "menu#update_menu_item"
 delete "menu/delete", to: "menu#delete_menu_item"

 get "/order/daily", to: "order#show_today_order"
 post "/order/add", to: "order#add_customer_order"
 post "/order/add/another", to: "order#add_another_order"
 put "/order/update", to: "order#update_customer_order"
end
