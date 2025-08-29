-- A generic CSV to XML converter

-- The CSV file
-- a,b,c
-- 1,2,3
--
-- gets converted into
---
-- <root>
--   <row>
--     <cell>a</cell>
--     <cell>b</cell>
--     <cell>c</cell>
--   </row>
--   <row>
--     <cell>1</cell>
--     <cell>2</cell>
--     <cell>3</cell>
--   </row>
-- </root>


-- You can set the order of the columns
-- The parameter columns is optional. If present, it contains the order
-- of the columns that are taken from the CSV file. For example. 3,2,1
-- outputs the first three columns in reverse order.
-- For more options see the manual at https://doc.speedata.de/publisher/en/advancedtopics/preprocessing/
-- You can set the character set (if your data is in Latin-1) and the separator (if it is not a comma)
csv = require("csv")
xml = require("xml")

csvtab, msg = csv.decode("us-500.csv",{columns = {2,1,4,7,8,5}})
if not csvtab then
    print(msg)
    os.exit(-1)
end

-- ret is a table that is almost suitable for the xml.encode_table() function.
-- We just need add the element names.



-- The root element
csvtab._name = "data"

for i=1,#csvtab do
    -- level 1
	csvtab[i]._name = "row"
	for j=1,#csvtab[i] do
        -- level 2
		local val = csvtab[i][j]
		csvtab[i][j] = { _name = "cell", val }
	end
end

-- Create a file named `data.xml`.
ok, err = xml.encode_table(csvtab)
if not ok then
    os.exit(-1)
end

