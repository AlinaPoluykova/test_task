load5News = ->
	$.get 'news.json', (data, status) ->
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


# Отправление сообщения
$('#contactForm').validator().on 'submit', (e) ->
	name = $('#inputName').val()
	phone = $('#inputPhone').val()
	email = $('#inputEmail').val()
	message = $('#inputMessage').val()
	if not e.isDefaultPrevented() and ($('#inputPhone').val() != '' or $('#inputEmail').val() != '')
		console.log('Cообщение отправлено! name: ' + name + ' phone: ' + phone + ' email: ' + email + ' message: ' + message)
		alert 'Сообщение отправлено'
		$.ajax(
			method: 'POST'
			url: 'some.php'
			data:
				name: name,
				phone: phone,
				email: email,
				message: message
		).done (msg) ->
			alert 'Data Saved: ' + msg
	else
		alert('Форма заполнена неверно. Необходимо заполнить поля телефон или email.')


#Навигация по странице
$(".general").click ->
	$("html, body").animate
		scrollTop: $("#general-requirements").offset().top
	, 1500
$(".task1").click ->
	$("html, body").animate
		scrollTop: $("#news").offset().top
	, 1500
$(".task2").click ->
	$("html, body").animate
		scrollTop: $("#contacts").offset().top
	, 1500
$(".task3").click ->
	$("html, body").animate
		scrollTop: $("#icons").offset().top
	, 1500
$(".task4").click ->
	$("html, body").animate
		scrollTop: $("#navigation").offset().top
	, 1500
$(".task5").click ->
	$("html, body").animate
		scrollTop: $("#adaptive").offset().top
	, 1500
$(".task6").click ->
	$("html, body").animate
		scrollTop: $("#optimization").offset().top
	, 1500

