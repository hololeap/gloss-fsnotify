
module Gloss where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Animate

import Exit

windowDisplay :: Display
windowDisplay = InWindow "Window" (200, 200) (10, 10)

myAnimate :: FSChanged -> IO ()
myAnimate changed = animateIO windowDisplay white animationFunc (\_ -> exitOnFSNotify changed)

animationFunc :: Float -> IO Picture
animationFunc time = return $ Circle (1 * time)
