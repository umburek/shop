admin = User.create(
  email: 'admin@admin.com',
  password: 'secret',
  password_confirmation: 'secret',
  role: :admin
)

[
  ['makaron świderki', 1, 'pasta'],
  ['filet z kurczaka', 2, 'meat'],
  ['cebula', 3, 'vegetables'],
  ['papryka', 4, 'vegetables'],
  ['pomidor', 5, 'vegetables'],
  ['przecier pomidorowy', 6, 'other'],
  ['ząbek czosnku', 7, 'vegetables'],
  ['mozarella light', 8, 'dairy'],
  ['olej', 9, 'other'],
  ['woda', 10, 'other'],
  ['mąka', 11, 'other'],
  ['jajka', 12, 'dairy'],
  ['śmietana', 13, 'dairy'],
  ['wołowina', 14, 'meat'],
  ['makaron spaghetti', 15, 'pasta'],
  ['krewetki królewskie', 16, 'seafood'],
  ['pomarańcza', 17, 'fruit'],
  ['czekolada Milka', 18, 'chocolate'],
  ['kakao Nesquik', 19, 'chocolate'],
  ['rodzynki', 20, 'delicacies'],
  ['mak', 21, 'delicacies'],
  ['borowik', 22, 'mushrooms'],
  ['kurka', 23, 'mushrooms'],
  ['jajko na twardo', 24, 'eggs'],
  ['kasza jaglana', 25, 'groats'],
  ['kasza kuskus', 26, 'groats'],
  ['szczypiorek', 27, 'plants'],
  ['mięta', 28, 'plants'],
  ['ryż jaśminowy', 29, 'rice'],
  ['ryż brązowy', 30, 'rice']
].each do |name, uid, _category|
  Product.create(name: name, uid: uid)
end