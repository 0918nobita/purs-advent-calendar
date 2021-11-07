module Main where

import Data.Lens (Iso', iso, review, view)
import Effect (Effect)
import Effect.Class.Console (log)
import Prelude

-- Lens とは？
-- type Lens s t a b = forall p. Strong p => Optic p s t a b
-- Lens は Optic p s t a b の p に Strong 制約を追加したもの

-- Optic とは？
-- type Optic :: forall k1 k2. (k1 -> k2 -> Type) -> k1 -> k2 -> k1 -> k2 -> Type
-- type Optic p s t a b = p a b -> p s t

-- Optic は、第一級の合成可能な下部構造の概念
-- ある「外側」のタイプ S と、「内側」のタイプ A の間には、どのような関係が考えられるか？
-- (ここでは簡単のため、A を他の型 B に変更し、S を他の型 T に変更する、型の変わる操作の可能性を最初に無視する)

-- まず、S と A は同型 (isomorphism) かもしれない。
-- つまり、S -> A と A -> S を相互に変換する逆関数が存在するかもしれない。
-- これは、下部構造のやや些細な概念で、A は「Sのすべて」を表現する別の方法に過ぎない。
-- type Iso s t a b = forall p. Profunctor p => Optic p s t a b
-- type Iso' s a = Iso s s a a
-- Iso' S A は S と A の間の凖同型写像を表す。
-- その変換のための関数が view と review

-- S が単なる直積型の場合、A は S の単一のフィールドかもしれない。
-- より一般的には、A は、「他のフィールドを表す何らかの型 C について、
-- S がペア (A, C) に同型である」という意味で「S の一部」かもしれない。

newtype Age = Age Int

coerced :: Iso' Age Int
coerced = iso (\(Age n) -> n) Age

ageToInt :: Age -> Int
ageToInt = view coerced

intToAge :: Int -> Age
intToAge = review coerced

main :: Effect Unit
main = log "Hello, world!"
