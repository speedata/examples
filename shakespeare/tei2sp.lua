runtime = require("runtime")
ok, msg = runtime.run_saxon("tei2speedata.xsl","3014_fol-JC.tei.xml","data.xml")

if not ok then
    print(msg)
    os.exit(-1)
end


