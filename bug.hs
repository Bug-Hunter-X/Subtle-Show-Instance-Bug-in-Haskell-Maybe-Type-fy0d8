{-# LANGUAGE FlexibleInstances #-}

instance (Show a) => Show (Maybe a) where
  showsPrec p Nothing = showString "Nothing" 
  showsPrec p (Just x) = showParen (p > 10) $ showString "Just " . showsPrec 11 x

instance (Eq a) => Eq (Maybe a) where
  Nothing == Nothing = True
  (Just x) == (Just y) = x == y
  _ == _ = False

main :: IO ()
main = do
  print (Nothing :: Maybe Int)
  print (Just 5 :: Maybe Int)
  print (Nothing == Nothing)
  print (Just 5 == Just 5)
  print (Just 5 == Nothing)