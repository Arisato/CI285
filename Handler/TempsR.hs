module Handler.TempsR where

import Import

getTempsR :: Handler Value
getTempsR = do
	res <- runDB $ selectList [] [Asc TempdatesId]
	returnJson res

