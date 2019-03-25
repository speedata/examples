runtime = require("runtime")
ok, msg = runtime.run_saxon("piechart.xsl","data.xml","chart.svg")

-- den Publishing-Prozess abbrechen, wenn die Transformation fehl schlägt.
if not ok then
    print(msg)
    os.exit(-1)
end

