-- requires speedata Publisher version >= 3.9.4

runtime = require("runtime")
ok, msg = runtime.run_saxon({
    stylesheet = 'json2xml.xsl',
    out = 'data.xml',
    initialtemplate='main',
    params = 'filename=us-500.json'})

-- stop the publishing run when anything got wrong
if not ok then
    print(msg)
    os.exit(-1)
end

