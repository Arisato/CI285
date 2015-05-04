module Handler.TempsR where

import Import

-- Fetch Temperature values from database
-- Display as avarage on HTML
getTempsR :: Handler Html
getTempsR = do
	res <- runDB $ selectList [] [Asc TempdatesId]
	let result = map (\(Entity _ tmp) -> tmp ) res
	let val = (getAverage result)
	defaultLayout $(widgetFile "temps")

getAverage :: [Tempdates] -> Float
getAverage ls = (getSum ls) / (fromIntegral (length ls))

getSum :: [Tempdates] -> Float
getSum [] = 0
getSum (x:xs) = (getTemperatureVal x) + getSum xs

getTemperatureVal :: Tempdates -> Float
getTemperatureVal (Tempdates _ t) = fromIntegral t