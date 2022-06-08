OIFS="$IFS"
IFS=$'\n'
top='<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Design Docs</title>
    <meta charset="UTF-8">
    <link href="static/base_style.css" rel="stylesheet" type="text/css" />
    <link href="static/colours.css" rel="stylesheet" type="text/css" />
    <link href="static/fonts.css" rel="stylesheet" type="text/css" />

  </head>
  <body>
    <header>
      
      <nav class="std_nav">
	<div class="navcontainer">
	  <a id="navlogoa" href="/"><img src="static/logo.jpg" alt="ShockSoc Logo" id="navlogo"/>Group3</a>
	  <ul>
	    
	    <li><a class="nav-link" href="index.html">Home</a></li>
	    
	    <li><a class="nav-link" href="about.html">About</a></li>
	    
	    <li><a class="nav-link" href="docs.html">Docs</a></li>

	    <li><a class="nav-link" href="buy.html">Pricing</a></li>
	    
	  </ul>
	</div>
      </nav>
      <div style="height: 0rem; width: 100%; z-index=-1; background-color: transparent;"/>
    </header>
    <div>
      <div id="readmeDiv">
      <h1>Meetings</h1>'
meeting='<a href="static/%s"><h3>%s</h3></a><br><hr><br>'
end='</div>
    </div>
  </body>
  <br>
  <footer class="std_footer">
    <div id="footer-container">
      David Miall
    </div>
  </footer>
</html>'

echo "$top" > meetings.html
cd internal
echo "<h2>Internal Meetings</h2><br><hr><br>" >> meetings.html
for file in `find . -type f -name "*.docx" -printf "%f\n"`  
do
	pdf=$(echo "$file" | sed 's/docx/pdf/g')
	pandoc -s "$file" -o "../$pdf"
	printf "$meeting" "$pdf" "$pdf" >> ../meetings.html
	echo "$pdf"

done
cd ..
echo "<h2>External Meetings</h2><br><hr><br>" >> meetings.html
cd external
for file in `find . -type f -name "*.docx" -printf "%f\n"`
do
	pdf=$(echo "$file" | sed 's/docx/pdf/g')
	pandoc -s "$file" -o "../$pdf"
	printf "$meeting" "$pdf" "$pdf" >> ../meetings.html
	echo "$pdf"

done
cd ../
echo "$end" >> meetings.html
IFS="$OIFS"
