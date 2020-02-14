-- requires speedata Publisher version >= 3.9.4

runtime = require("runtime")
ok, msg = runtime.run_saxon({stylesheet = 'json2xml.xsl', out = 'data.xml',initialtemplate='main'})

-- den Publishing-Prozess abbrechen, wenn die Transformation fehl schlägt.
if not ok then
    print(msg)
    os.exit(-1)
end

