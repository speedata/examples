xlsx = require("xlsx")
xml = require("xml")

spreadsheet, err = xlsx.open("us-500.xlsx")

if not spreadsheet then
    print(err)
    os.exit(-1)
end

-- get the number of spreadsheets with the # operator (#spreadsheet)
ws = spreadsheet[1]
if not ws then
    os.exit(-1)
end


local data = {}
local row, cell

data._name = "data"

for y=ws.minrow,ws.maxrow do
    row = {}
    row._name = "row"
    for x=ws.mincol,ws.maxcol do
        cell = {}
        cell._name = "cell"
        -- ws() gets the contents of the worksheet at position x,y
        -- where the top left is at 1,1
        cell[1] = ws(x,y)
        row[#row + 1] = cell
    end
    data[#data + 1] = row
end

ok, err = xml.encode_table(data)
if not ok then
    print(err)
    os.exit(-1)
end

