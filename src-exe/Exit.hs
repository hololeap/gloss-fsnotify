
module Exit where

import Control.Concurrent.MVar
import System.Exit
import System.FSNotify (Event)

type FSChanged = MVar Event -- Empty until the filesystem has changed

exitOnFSNotify :: FSChanged -> IO ()
exitOnFSNotify changed = do
    event <- readMVar changed
    putStrLn $ "fsnotify event received: " ++ show event
    putStrLn "Exiting..."
    exitSuccess

