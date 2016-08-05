<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    <p:xslt name="Transformation">
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:document href="3014_fol-JC.tei.xml"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="tei2speedata.xsl"/>
        </p:input>
    </p:xslt>
    <p:store href="data.xml"/>
</p:declare-step>
