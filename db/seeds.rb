#Map.create

1.upto(3) do |i|
  Map.create!(name: "地図#{i}", password: "password", creater: "ユーザー#{i}")
end

#Site.create

icons = ["fa fa-street-view fa-5x",
  "fa fa-star fa-5x",
  "fa fa-home  fa-5x",
  "fa fa-flag fa-5x",
  "fa fa-tint fa-5x",
  "fas fa-battery-3 fa-5x",
  "fa fa-bed fa-5x",
  "fa fa-cart-arrow-down fa-5x",
  "fas fa-gas-pump fa-5x",
  "fa fa-phone-square fa-5x",
  "fa fa-wifi fa-5x",
  "fas fa-restroom fa-5x",
  "fas fa-shower fa-5x",
  "fas fa-bath fa-5x",
  "fas fa-utensils fa-5x",
  "fas fa-yen-sign fa-5x",
  "fas fa-shipping-fast fa-5x",
  "fas fa-charging-station fa-5x",
  "fas fa-lightbulb fa-5x",
  "far fa-building fa-5x",
  "fas fa-subway fa-5x",
  "fas fa-taxi fa-5x",
  "fa fa-fire fa-5x",
  "fa fa-ban fa-5x",
  "fas fa-times-circle fa-5x",
  "fa fa-exclamation-triangle fa-5x",
  "far fa-check-square fa-5x",
  "fa fa-info-circle fa-5x",
  "fa fa-question-circle fa-5x",
  "fa fa-people-carry fa-5x",
  "far fa-comments fa-5x",
  "fa fa-plus-square fa-5x",
  "fa fa-ambulance fa-5x",
  "fa fa-medkit fa-5x",
  "fa fa-user-md fa-5x",
  "fa fa-heartbeat fa-5x",
  "fa fa-female fa-5x",
  "fa fa-child fa-5x",
  "fas fa-baby fa-5x",
  "fa fa-baby-carriage fa-5x",
  "fa fa-wheelchair fa-5x",
  "fas fa-american-sign-language-interpreting fa-5x",
  "fa fa-assistive-listening-systems fa-5x",
  "fa fa-paw fa-5x"]
map_first = Map.first.id
1.upto(44) do |i|
  Site.create!(title: "サイト#{i}", map_id: "#{map_first + (i % 3)}", name: icons[i - 1], latitude:Random.rand(35.61 .. 35.62), longitude:Random.rand(139.71 .. 139.72))
end

#Comment.create
site_first = Site.first.id
1.upto(88) do |i|
  Comment.create!(content:"テストコメント#{i}", site_id: "#{site_first + (i % 44)}")
end

#Review.create

comment_last = Comment.last.id
1.upto(88) do |i|
  Review.create!(good:"#{i % 5}", bad:"#{i % 3}",comment_id: "#{comment_last + i - 1}")
end
