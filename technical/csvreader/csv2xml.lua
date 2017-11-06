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
-- For more options see the manual at https://speedata.github.io/publisher/manual/description-en/luafilter.html
-- You can set the character set (if your data is in Latin-1) and the separator (if it is not a comma)
ok, ret = csv.decode("us-500.csv",{columns = {1,2,3}})
if not ok then
    print(ret)
    os.exit(-1)
end

-- ret is a table that is almost suitable for the xml.encode_table() function.
-- We just need add the element names.



-- The root element
ret._name = "data"

for i=1,#ret do
    -- level 1
	ret[i]._name = "row"
	for j=1,#ret[i] do
        -- level 2
		local val = ret[i][j]
		ret[i][j] = { _name = "cell", val }
	end
end

-- Create a file named `data.xml`.
ok, err = xml.encode_table(ret)
if not ok then
    os.exit(-1)
end

