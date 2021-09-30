-- https://zenn.dev/blackenedgold/books/introduction-to-idris/viewer/types-and-datatypes

-- データ型
data Bool = True | False
data Person = MkPerson Integer String
data FizzBuzz = F | B | FB | I Integer
data IntList = Cons Int IntList | Nil
-- Cons 1 (Cons 2 (Cons 3 Nil))

-- idris2の場合関数名と変数名が同一だとDeclaration name shadowedとエラーになった
getAge : Person -> Integer
getAge (MkPerson age _) = age

getName : Person -> String
getName (MkPerson _ name) = name

-- データ型とパターンマッチ
toString : Integer -> String
toString n = show n

show1 : FizzBuzz -> String
show1 F     = "fizz"
show1 B     = "buzz"
show1 FB    = "fizzbuzz"
show1 (I n) = toString n

length : IntList -> Int
length Nil         = 0
length (Cons _ tl) = 1 + (length tl)

-- ジェネリクス
data MyList a = Cons2 a (MyList a) | Nil2

IList : Type
IList = MyList Integer

CList : Type
CList = MyList Char

length2 : MyList a -> Integer
length2 Nil2         = 0
length2 (Cons2 _ tl) = 1 + (length2 tl)

-- Cons2 1 (Cons2 2 (Cons2 3 Nil2))
-- Cons2 'a' (Cons2 'b' (Cons2 'c' Nil2))

-- レコード
record Person2 where
  constructor MkPerson2
  age: Int
  name: String

incAge: Person2 -> Person2
incAge = record { age $= (+ 1) }
