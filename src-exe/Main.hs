{-# Language ScopedTypeVariables #-}

module Main where

import Control.Concurrent.MVar
import System.FSNotify

import Gloss

main :: IO ()
main = do
    changed <- newEmptyMVar
    withManager $ \mgr -> do
        -- start a watching job (in the background)
        stopListening <- watchDir
            mgr          -- manager
            "."          -- directory to watch
            (const True) -- predicate
            (putMVar changed) -- push the Event to the MVar

        myAnimate changed -- This will continue running until the MVar gets pushed
