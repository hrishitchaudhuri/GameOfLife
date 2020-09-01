function checkKey(key)
    if key == 'p' then
        run = 1
    elseif key == 'r' then
        love.load()
    end
end

function checkStart(cellmap)
    if run==1 then rungame(cellmap) end
end

function rungame(cellmap)
    local temp={}
    local temp_row={}
    
    for i=1,#cellmap.cells do
        for j=1,#cellmap.cells[i] do
            table.insert(temp_row, cellmap.cells[i][j])
        end
        table.insert(temp, temp_row)
        temp_row = {}
    end

    for i=1,#cellmap.cells do
        for j=1,#cellmap.cells[i] do
            neighbors=cellmap:check_neighbours(i, j)
            if cellmap.cells[i][j]==0 then
                if neighbors == 3 then
                    temp[i][j] = 1
                end
            else
                if neighbors < 2 or neighbors > 3 then
                    temp[i][j] = 0
                end
            end
        end
    end

    cellmap.cells=temp

    sleep(0.5)
end

function sleep(n)  -- seconds
    local t0 = os.clock()
    while os.clock() - t0 <= n do end
end