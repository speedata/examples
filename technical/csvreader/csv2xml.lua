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


-- You can select the order of the columns
ok, ret = csv.decode("us-500.csv",{columns = {2,1,4,7,8,5}})
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

