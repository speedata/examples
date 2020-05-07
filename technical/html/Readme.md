To get the PDF:

Run `sp html main.html` on the command line inside this directory.

----

# The new standalone HTML interface

A preliminary example of the new HTML interface (also use with `sd:html()` in publisher mode, see below).
Note that the Lua API is subject to change.

![Image of the result](firstpage.png)

You can play with it, but most likely everything not covered in the source will not work. Expect lots of updates to this.

Needs speedata Publisher version >= 3.9.10.


----

The standalone interface uses this layout:

```xml
<Layout xmlns="urn:speedata.de:2009/publisher/en"
        xmlns:sd="urn:speedata:2009/publisher/functions/en"
        version="3.9.10">
   <Stylesheet filename="mystyle.css"/>
   <Record element="data">
      <Output>
         <Text>
            <HTML>
               <Value select="sd:html(.)"/>
            </HTML>
         </Text>
      </Output>
   </Record>
</Layout>
```

and the data file similar as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<data><![CDATA[
  <h1>Header 1</h1>
...
]]>
</data>
```