load5News = ->
	$.get 'news.json', (data, status) ->
		console.log 'Data: ' + data + '\nStatus: ' + status
		news_html = ''
		for item, i in data
			is_even = if i % 2 is 0 then true else false
			if item.image
				if is_even
					news_html += """
						<div class='info-block row'>
							<div class='col-md-3'>
								<img src='#{item.image}'/>
							</div>
							<div class='col-md-9'>
								<p>#{item.date}</p>
								<h2>#{item.title}</h2>
								<p>#{item.preview}</p>
							</div>
						</div>
						<hr>
					"""
				else
					news_html += """
							<div class='info-block row'>
								<div class='col-md-9'>
									<p>#{item.date}</p>
									<h2>#{item.title}</h2>
									<p>#{item.preview}</p>
								</div>
								<div class='col-md-3'>
									<img src='#{item.image}'/>
								</div>
							</div>
							<hr>
						"""
			else
				news_html += """
						<div class='info-block row'>
							<div class='col-md-12'>
								<p>#{item.date}</p>
								<h2>#{item.title}</h2>
								<p>#{item.preview}</p>
							</div>
						</div>
						<hr>
					"""
		$('.info-container').append(news_html);
load5News();
# Подгружаем еще 5 новостей
$('.load-more').click ->
	load5News();


