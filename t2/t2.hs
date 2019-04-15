import Text.Printf
import Data.Fixed

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)


-------------------------------------------------------------------------------
-- Paletas
-------------------------------------------------------------------------------

--rgbPalette :: Int -> [(Int,Int,Int)]
--rgbPalette n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255)]

rgbPalette :: Int -> Int -> [(Int,Int,Int)]
rgbPalette l c = [if (i `mod` 3) == 0 then (60+(j+(i*c))*5,0,0) else if (i `mod` 3) == 1 then (0,60+(j+(i*c))*5,0) else (0,0,60+(j+(i*c))*5) | i <- [0..l-1], j <- [0..c-1]]

-------------------------------------------------------------------------------
-- Geração de retângulos em suas posições
-------------------------------------------------------------------------------

genRectsInLines :: Int -> Int -> [Rect]
genRectsInLines l c = [((mx*(w+gap),m*(h+gap)),w,h) | m <- [0..fromIntegral (l-1)] , mx <- [0..fromIntegral (c-1)]]
  where (w,h) = (50,50)
        gap = 10


-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando retângulo SVG 
-- dadas coordenadas e dimensoes do retângulo e uma string com atributos de estilo
svgRect :: Rect -> String -> String 
svgRect ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: screen;" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma funcao geradora de strings SVG, uma lista de círculos/retângulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------

main :: IO ()
main = do
  writeFile "case1.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = genRectsInLines lines columns 
        palette = rgbPalette lines columns
        nrects = lines * columns
        lines = 7
        columns = 6
        (w,h) = (1500,500) -- width,height da imagem SVG
