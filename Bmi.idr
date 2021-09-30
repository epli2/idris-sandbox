-- https://zenn.dev/blackenedgold/books/introduction-to-idris/viewer/bmi
-- idris2であればUTF8が普通に使えるみたい

bmi : Double -> Double -> Double
bmi weight height = weight / height / height

diagnostic : Double -> Double -> String
diagnostic weight height =
  let index = bmi weight height in
  if index < 18.5
  then "低体重"
  else if index < 25.0
  then "普通体重😀"
  else if index < 30.0
  then "肥満（1度）"
  else if index < 35.0
  then "肥満（2度）"
  else if index < 40.0
  then "肥満（3度）"
  else "肥満（4度）"
