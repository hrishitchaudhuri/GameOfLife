function love.load()
    local font = love.graphics.newFont("assets/font.ttf", 20)
    love.graphics.setFont(font)

    liveimage = love.graphics.newImage("assets/livetile.png")
    deadimage = love.graphics.newImage("assets/deadtile.png")
    
    local cell_width = deadimage:getWidth()
    local cell_height = deadimage:getHeight()

    local cell_x = 38
    local cell_y = 16

    Object = require "src/classic"

    require "src/cells"
    cellmap = Cellmap(cell_x, cell_y, cell_width, cell_height)
    
    love.window.setMode((cellmap.cell_x * 32) + 64, (cellmap.cell_y * 32) + 64)

    cellmap:init()

    love.graphics.setBackgroundColor(0.8, 0.8, 0.8)
    require "src/game"
    run = 0
end

function love.update(dt)
    checkStart(cellmap)
end

function love.draw()
    cellmap:draw(liveimage, deadimage)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Conway's Game of Life -- by Hrishit Chaudhuri", 
        0,
        5, 
        love.graphics:getWidth(),
        "center")

    love.graphics.printf("P: Start Automaton            R: Restart Automaton", 
		0, 
		love.graphics:getHeight() - 20, 
		love.graphics:getWidth(), 
        "center")
    love.graphics.setColor(1, 1, 1)
end

function love.mousepressed(x, y, button, istouch)
    cellmap:checkpress(x, y, button)
end

function love.keypressed(key)
    checkKey(key)
end