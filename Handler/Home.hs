module Handler.Home where

import Import
import Network.HTTP.Conduit
import qualified Data.Text as T
import qualified Data.Aeson as A
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3,
                              withSmallInput)
import Control.Applicative
import qualified Data.ByteString.Lazy.Internal as BS 

-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.



-- Stores dates and temperatures
-- Then returns them as HTML
getHomeR :: Handler Html
getHomeR = do
    let storeJson [] = return ()
        storeJson (x:xs) = do 
            _ <- runDB $ insert $ x
            storeJson xs
    result <- A.decode <$> (simpleHttp "http://www.phoric.eu/temperature")
    case result of
        Nothing -> defaultLayout [whamlet|<p>Failed!|]
        Just newResult -> do
                _ <- (storeJson (takeJson newResult))
                defaultLayout $(widgetFile "homepage")
 
-- Unwraps temperatures
takeJson :: MsgJson -> [Tempdates]
takeJson (MsgJson {temperatures = t}) = t


{-
getHomeR :: Handler Text
getHomeR = do 
    res <- simpleHttp "http://www.phoric.eu/temperature"
    return (T.pack $ show $ res)

megBite :: BS.ByteString
megBite = simpleHttp "http://www.phoric.eu/temperature"
-}