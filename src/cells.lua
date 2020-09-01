Cellmap = Object:extend()

function Cellmap:new(cell_x, cell_y, cell_width, cell_height)
    self.cell_x = cell_x
    self.cell_y = cell_y
    self.cell_width = cell_width
    self.cell_height = cell_height
    self.cells = {}
end

function Cellmap:init()
    local hor_bound_up = self.cell_height
    local hor_bound_down = love.graphics:getHeight() - (2 * self.cell_height)
    local ver_bound_left = self.cell_width
    local ver_bound_right = love.graphics:getWidth() - (2 * self.cell_width)
    local row = {} 

    for i=hor_bound_up,hor_bound_down,self.cell_height do
        for i=ver_bound_left,ver_bound_right,self.cell_width do
            table.insert(row, 0)
        end
        table.insert(self.cells, row)
        row = {}
    end
end

function Cellmap:draw(liveimage, deadimage)
    for i=1,#cellmap.cells do
        for j=1,#cellmap.cells[i] do
            if cellmap.cells[i][j] == 0 then
                love.graphics.draw(deadimage, j * cellmap.cell_width, i * cellmap.cell_height)
            else
                love.graphics.draw(liveimage, j * cellmap.cell_width, i * cellmap.cell_height)
            end
        end
    end
end

function Cellmap:checkpress(x, y, button)
    if button == 1 then
        local j = math.ceil((x - cellmap.cell_width) / cellmap.cell_width)
        local i = math.ceil((y - cellmap.cell_height) / cellmap.cell_height)
        if i <= #cellmap.cells and cellmap.cells[i] ~= nil and j <= #cellmap.cells[i] and cellmap.cells[i][j] ~= nil then
            cellmap.cells[i][j] = (cellmap.cells[i][j] + 1) % 2
        end
    end
end

function Cellmap:check_neighbours(i, j)
    local count=0
    if i-1>0 then
        if j-1>0 then 
            count = count + cellmap.cells[i-1][j-1]
            count = count + cellmap.cells[i][j-1]
            if i+1<=#cellmap.cells then count = count + cellmap.cells[i+1][j-1] end
        end

        if j+1<=#cellmap.cells[i] then 
            count = count + cellmap.cells[i-1][j+1]
            count = count + cellmap.cells[i][j+1]
            if i+1<=#cellmap.cells then 
                count = count + cellmap.cells[i+1][j+1]
                count = count + cellmap.cells[i+1][j]
            end
        end

        count = count + cellmap.cells[i-1][j]
    end
    
    return count
end