local M = {}

-- Block Elements
--   https://www.unicode.org/charts/PDF/U2580.pdf
--
--       	0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
-- U+258x	▀	▁	▂	▃	▄	▅	▆	▇	█	▉	▊	▋	▌	▍	▎	▏
-- U+259x	▐	░	▒	▓	▔	▕	▖	▗	▘	▙	▚	▛	▜	▝	▞	▟
--
-- Block elements
-- 2580 ▀ UPPER HALF BLOCK
-- 2581 ▁ LOWER ONE EIGHTH BLOCK
-- 2582 ▂ LOWER ONE QUARTER BLOCK
-- 2583 ▃ LOWER THREE EIGHTHS BLOCK
-- 2584 ▄ LOWER HALF BLOCK
-- 2585 ▅ LOWER FIVE EIGHTHS BLOCK
-- 2586 ▆ LOWER THREE QUARTERS BLOCK
-- 2587 ▇ LOWER SEVEN EIGHTHS BLOCK
-- 2588 █ FULL BLOCK
-- 2589 ▉ LEFT SEVEN EIGHTHS BLOCK
-- 258A ▊ LEFT THREE QUARTERS BLOCK
-- 258B ▋ LEFT FIVE EIGHTHS BLOCK
-- 258C ▌ LEFT HALF BLOCK
-- 258D ▍ LEFT THREE EIGHTHS BLOCK
-- 258E ▎ LEFT ONE QUARTER BLOCK
-- 258F ▏ LEFT ONE EIGHTH BLOCK
-- 2590 ▐ RIGHT HALF BLOCK
--
-- Shade characters
-- 2591 ░ LIGHT SHADE
-- 2592 ▒ MEDIUM SHADE
-- 2593 ▓ DARK SHADE
--
-- Block elements
-- 2594 ▔ UPPER ONE EIGHTH BLOCK
-- 2595 ▕ RIGHT ONE EIGHTH BLOCK
--
-- Terminal graphic characters
-- 2596 ▖ QUADRANT LOWER LEFT
-- 2597 ▗ QUADRANT LOWER RIGHT
-- 2598 ▘ QUADRANT UPPER LEFT
-- 2599 ▙ QUADRANT UPPER LEFT AND LOWER LEFT AND LOWER RIGHT
-- 259A ▚ QUADRANT UPPER LEFT AND LOWER RIGHT
-- 259B ▛ QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER LEFT
-- 259C ▜ QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER RIGHT
-- 259D ▝ QUADRANT UPPER RIGHT
-- 259E ▞ QUADRANT UPPER RIGHT AND LOWER LEFT
-- 259F ▟ QUADRANT UPPER RIGHT AND LOWER LEFT AND LOWER RIGHT

M.snacks_default = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]
M.neovim_micro_logo = [[
  ▟▙▚   ▙▚  
 ▟██▙▚  █▙▚ 
▐██▜█▙▚ ██▌▌
▐██▐▜█▙▚██▌▌
▐██▐ ▜█▙██▌▌
 ▜█▐  ▜██▛▞ 
  ▜▐   ▜▛▞  ]]
M.neovim_logo_frame = [[
   ▗▞▛▖       ▐▚▖   
 ▗▞▘ ▌▝▄      ▐ ▝▚▖ 
▞▘▚  ▌  ▚     ▐   ▝▚
▌  ▚ ▌   ▀▖   ▐    ▐
▌   ▚▌    ▝▄  ▐    ▐
▌    ▛▄     ▚ ▐    ▐
▌    ▌ ▚     ▀▟    ▐
▌    ▌  ▀▖    ▐▚   ▐
▌    ▌   ▝▄   ▐ ▚  ▐
▚▖   ▌     ▚  ▐  ▚▗▞
 ▝▚▖ ▌      ▀▖▐ ▗▞▘ 
   ▝▚▌       ▝▟▞▘   ]]

return M
