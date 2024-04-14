import Data.List

main :: IO ()
main = do
  putStrLn "Введите количество чисел для ввода:"
  size <- readLn
  numbers <- getNumbers size []
  let resultIndexes = findIndexes numbers
  mapM_ (\i -> putStrLn $ "Index number = " ++ show i) resultIndexes

getNumbers :: Int -> [Int] -> IO [Int]
getNumbers 0 acc = return $ reverse acc
getNumbers n acc = do
  putStrLn $ "Введите " ++ show n ++ " число:"
  inputNumber <- readLn
  getNumbers (n-1) (inputNumber : acc)

findIndexes :: [Int] -> [Int]
findIndexes numbers = findIndexes' numbers 0
  where
    findIndexes' [] _ = []
    findIndexes' (x:xs) i
      | x >= 0 = if sumDigits x < multDigits x
                     then i : findIndexes' xs (i+1)
                     else findIndexes' xs (i+1)
      | otherwise = findIndexes' xs (i+1)

sumDigits :: Int -> Int
sumDigits = sum . map (\c -> read [c]) . show

multDigits :: Int -> Int
multDigits = product . map (\c -> read [c]) . show