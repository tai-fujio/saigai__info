#Map.create

1.upto(3) do |i|
  Map.create!(name: "地図#{i}", password: "password", creater: "ユーザー#{i}")
end

#Site.create

icons = ["fa fa-street-view fa-3x",
  "fa fa-star fa-3x",
  "fa fa-home  fa-3x",
  "fa fa-flag fa-3x",
  "fa fa-tint fa-3x",
  "fas fa-battery-3 fa-3x",
  "fa fa-bed fa-3x",
  "fa fa-cart-arrow-down fa-3x",
  "fas fa-gas-pump fa-3x",
  "fa fa-phone-square fa-3x",
  "fa fa-wifi fa-3x",
  "fas fa-restroom fa-3x",
  "fas fa-shower fa-3x",
  "fas fa-bath fa-3x",
  "fas fa-utensils fa-3x",
  "fas fa-yen-sign fa-3x",
  "fas fa-shipping-fast fa-3x",
  "fas fa-charging-station fa-3x",
  "fas fa-lightbulb fa-3x",
  "far fa-building fa-3x",
  "fas fa-subway fa-3x",
  "fas fa-taxi fa-3x",
  "fa fa-fire fa-3x",
  "fa fa-ban fa-3x",
  "fas fa-times-circle fa-3x",
  "fa fa-exclamation-triangle fa-3x",
  "far fa-check-square fa-3x",
  "fa fa-info-circle fa-3x",
  "fa fa-question-circle fa-3x",
  "fa fa-people-carry fa-3x",
  "far fa-comments fa-3x",
  "fa fa-plus-square fa-3x",
  "fa fa-ambulance fa-3x",
  "fa fa-medkit fa-3x",
  "fa fa-user-md fa-3x",
  "fa fa-heartbeat fa-3x",
  "fa fa-female fa-3x",
  "fa fa-child fa-3x",
  "fas fa-baby fa-3x",
  "fa fa-baby-carriage fa-3x",
  "fa fa-wheelchair fa-3x",
  "fas fa-american-sign-language-interpreting fa-3x",
  "fa fa-assistive-listening-systems fa-3x",
  "fa fa-paw fa-3x"]
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
