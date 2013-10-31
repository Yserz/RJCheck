var newsPage = Handlebars.compile(TT.Renderer.requireTemplate("resources/pages/templates/newsPage.html").responseText);
Handlebars.registerPartial("newsPage", newsPage);
var articleList = Handlebars.compile(TT.Renderer.requireTemplate("resources/components/templates/articleList.html").responseText);
Handlebars.registerPartial("articleList", articleList);
var article = Handlebars.compile(TT.Renderer.requireTemplate("resources/components/templates/article.html").responseText);
Handlebars.registerPartial("article", article);


$("head").append(TT.Renderer.basehead({}));
$("body").append(newsPage({}));
$("#articleList").append(articleList({
	"id": 1,
	"name": "BlogName",
	"articles": [
		{"id": 1, "title": "Highlight your Code!", "blog": 1, "elements": "<p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>\n<pre><code class=\"language-java\">import java.lang.String;\n/**\n * @author Example\n */\npublic class Main {\n	public static void main(String[] args) {\n		System.out.println(\"Hello World!\");\n	}\n}</code></pre>"},
		{"id": 2, "title": "Arrange your Article.", "blog": 1, "elements": "<div class=\"row-fluid\">\n<div class=\"span3\">\n<h2>Example</h2>\n<p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>\n<p>\n</div><!--/span-->\n<div class=\"span3\">\n<h2>Code</h2>\n<pre><code class=\"html\">&lt;!-- That's an Example -->\n&lt;html>\n  &lt;body>\n    &lt;a src=\"path.png\">\n    &lt;p>Hello World!&lt;/p>\n  &lt;/body>\n&lt;/html></code></pre>\n</div><!--/span-->\</div><!--/row-->\n</div>"},
		{"id": 3, "title": "And lastly, this one. ", "blog": 1, "elements": "<p class=\"lead\">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>"}]
}));
$('#naviExample').addClass('active');