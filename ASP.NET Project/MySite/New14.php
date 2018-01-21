<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script type='text/javascript' src='http://em.com.eg/editor/fadeslideshow.js'></script>

<script type='text/javascript'>
var mygallery2=new fadeSlideShow({
	wrapperid: 'FadeShowArrows', //ID of blank DIV on page to house Slideshow
	dimensions: [250, 180], //width/height of gallery in pixels. Should reflect dimensions of largest image
	imagearray: [
		['http://i26.tinypic.com/11l7ls0.jpg', '', '', 'Nothing beats relaxing next to the pool when the weather is hot.'],
		['http://i29.tinypic.com/xp3hns.jpg', 'http://en.wikipedia.org/wiki/Cave', '_new', 'Some day Id like to explore these caves!'],
		['http://i30.tinypic.com/531q3n.jpg'],
		['http://i31.tinypic.com/119w28m.jpg', '', '', 'What a beautiful scene with everything changing colors.'] //<--no trailing comma after very last image element!
	],
	displaymode: {type:'manual', pause:2500, cycles:0, wraparound:false},
	persist: false, //remember last viewed slide and recall within same session?
	fadeduration: 500, //transition duration (milliseconds)
	descreveal: 'always',
	togglerid: 'FadeShowToggler'
})
</script>

<div id='FadeShowArrows'></div>

<div id='FadeShowToggler' style='width:250px; text-align:center; margin-top:10px'>
<a href='#' class='prev'><img src='http://i31.tinypic.com/302rn5v.png' style='border-width:0'></a><span class='status' style='margin:0 50px; font-weight:bold'></span> <a href='#' class='next'><img src='http://i30.tinypic.com/lzkux.png' style='border-width:0'></a>
</div>