import Data.List

main :: IO ()
main = do
  let numbers = [76, 24, 614, 14, 1112,56]
  let result = filterIndices numbers
  mapM_ print result

filterIndices :: [Int] -> [Int]
filterIndices numbers = findIndices (\x -> sumDigits x < productDigits x) numbers

sumDigits :: Int -> Int
sumDigits n = sum $ map (\x -> read [x] :: Int) (show n)

productDigits :: Int -> Int
productDigits n = product $ map (\x -> read [x] :: Int) (show n)