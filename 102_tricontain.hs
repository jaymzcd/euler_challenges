-- Three distinct points are plotted at random on a Cartesian plane, for which
-- -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
--
-- Consider the following two triangles:
--
--  A(-340,495), B(-153,-910), C(835,-947)
--
--  X(-175,41), Y(-421,-714), Z(574,-645)
--
-- It can be verified that triangle ABC contains the origin, whereas triangle XYZ
-- does not.
--
-- Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text
-- file containing the co-ordinates of one thousand "random" triangles, find the
-- number of triangles for which the interior contains the origin.
--
-- NOTE: The first two examples in the file represent the triangles in the
-- example given above.

import System.IO
import Data.List.Split

-- Well this took me some hours to work out! Pausing.
getdata :: String -> IO [[Int]]
getdata filename = do
    raw <- readFile filename
    return [[read x :: Int | x <- splitOn "," s] | s <- lines raw]

main :: IO ()
main = do
    d <- getdata "triangles.txt"
    print $ take 5 d
