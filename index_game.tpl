<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="{$css_path}/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- go to favicon-generator.org, generate a favicon there and place it in /public_html/img/icon -->
	<link rel="apple-touch-icon" sizes="57x57" href="{$icon_path}/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="{$icon_path}/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="{$icon_path}/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="{$icon_path}/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="{$icon_path}/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="{$icon_path}/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="{$icon_path}/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="{$icon_path}/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="{$icon_path}/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="{$icon_path}/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="{$icon_path}/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="{$icon_path}/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="{$icon_path}/favicon-16x16.png">
    <link rel="manifest" href="{$icon_path}/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="{$icon_path}/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">

    <style>
    #inputWord {
		background-color: transparent;
		border: 0px solid;
		color: black;
		font-size:40px;
	}
	#inputWord:focus{
		border-color: inherit;
		  -webkit-box-shadow: none;
		  box-shadow: none;
		  outline:none;
	}
	#d-def {
		overflow-y: scroll; 
		height:150px;
		padding: 20px;
	}
    </style>
    <title>{$name}</title>
  </head>
  <body>
	{if $page eq "start"}
	
	
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;" style="position:fixed">
	  <a class="navbar-brand" href="/game">
		<img src="{$icon_path}/android-icon-36x36.png" width="30" height="30" class="d-inline-block align-top" alt="">
	  </a>
	  <span class="navbar-brand mb-0 h1" id="demo">
		<span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
	  </span>
	  <div class="form-inline">
		<button class="btn btn-light my-2 my-sm-0" onclick="hint()" id="b-hint" style="margin-right: 5px"><i class="far fa-lightbulb"></i><span class="badge badge-light" id="s-hint" style="margin-left:2px; margin-right:0px">3</span></button>
		<button class="btn btn-light my-2 my-sm-0" onclick="skip()" id="b-skip"><i class="fas fa-step-forward"></i></button>
	  </div>
	</nav>
	<div id="d-start">
		<input id="inputWord" class="form-control form-control-lg" type="text" placeholder="Начинается на Х" autofocus spellcheck="false">
		<div class="progress" style="height: 3px;">
		  <div id="progress-bar" class="progress-bar bg-success" role="progressbar" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		<div class="jumbotron jumbotron-fluid" id="d-def">
		  <h3 id="definitionWord"></h3>
		</div>
	</div>
	
	<div id="d-end" style="display:none">
		<ul class="list-group">
		  <li class="list-group-item d-flex justify-content-between align-items-center">
			Слов
			<span class="badge badge-primary badge-pill" id="wordsCount"></span>
		  </li>
		  <li class="list-group-item d-flex justify-content-between align-items-center">
			Точность
			<span class="badge badge-primary badge-pill" id="correctPercent">2</span>
		  </li>
		  <li class="list-group-item d-flex justify-content-between align-items-center">
			Среднее время на слово
			<span class="badge badge-primary badge-pill" id="average">1</span>
		  </li>
		</ul>
		<div class="row">
			<div class="col text-center">
			  <button style="margin-top: 20px" class="btn btn-primary" onclick="location.reload();">Сыграть еще</button>
			</div>
		  </div>
	</div>
	
	{else}
	<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
	  <a class="navbar-brand" href="/game">
		<img src="{$icon_path}/android-icon-36x36.png" width="30" height="30" class="d-inline-block align-top" alt="">
		{$name}
	  </a>
	</nav>
	<div class="jumbotron">
	  <h1 class="display-4">Увеличьте словарный запас</h1>
	  <p class="lead">Выберите уровень, чтобы начать</p>
	  <hr class="my-4">
	    <div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="langBu" value="option1" checked>
		  <label class="form-check-label" for="langBu">Бурятский</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="langRu" value="option2" onclick="rus()" autocomplete="off">
		  <label class="form-check-label" for="langRu">Русский</label>
		</div>
	  <form action="" method="post">
	      <p>
		  <div class="btn-group btn-group-lg" role="group" aria-label="...">
			  <a href="index.php?l=easy" class="btn btn-secondary" id="a_easy">Легкий</a>
			  <a href="index.php?l=middle" class="btn btn-secondary" id="a_middle">Средний</a>
			  <a href="index.php?l=hard" class="btn btn-secondary" id="a_hard">Сложный</a>
	      </div></p>
	  </form>
	  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
		  Добавить
		</button>


	</div>
	
	
	
	{/if}
	
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Добавление слова</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		  <div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="level" id="inlineRadio1" value="0" checked>
			  <label class="form-check-label" for="inlineRadio1">Легкий</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="level" id="inlineRadio2" value="1">
			  <label class="form-check-label" for="inlineRadio2">Средний</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="level" id="inlineRadio3" value="2">
			  <label class="form-check-label" for="inlineRadio3">Сложный</label>
			</div>
		  <div class="form-group">
			<label for="new_word">Бурятский</label>
			<input type="text" class="form-control" id="new_word" placeholder="">
		  </div>
		  <div class="form-group">
			<label for="new_word_ru">Русский</label>
			<input type="text" class="form-control" id="new_word_ru" placeholder="">
		  </div>
		  <div class="form-group">
			<label for="exampleFormControlTextarea1">Определение</label>
			<textarea class="form-control" id="new_def" rows="3"></textarea>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
        <button type="button" class="btn btn-primary" onclick="add_word()">Сохранить</button>
      </div>
    </div>
  </div>
</div>	
	

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	{literal}
	<script>
	var oldDateObj = new Date();
	var newDateObj = new Date();
	var countDownDate = newDateObj.setTime(oldDateObj.getTime() + (92 * 1000));
	
	var x = setInterval(function() {
		var now = new Date().getTime();
		var distance = countDownDate - now;
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		if(minutes.toString().length == 1){
			minutes = '0' + minutes;
		}
		if(seconds.toString().length == 1){
			seconds = '0' + seconds;
		}
		document.getElementById("demo").innerHTML = minutes + ":" + seconds;
		
	  // If the count down is over, write some text 
	  if (distance < 0) {
		clearInterval(x);
		document.getElementById("demo").innerHTML = "";
		
		$('#d-start').hide();
		$('#b-skip').hide();
		var percent = 0;
		var	average = 0;
		if (i > 0){
			percent = Math.round(((correct / i * 100) + Number.EPSILON) * 100) / 100;
			average = Math.round(((90 / i) + Number.EPSILON) * 100) / 100;
		}
		$('#wordsCount').text(i);
		$('#correctPercent').text(percent + '%');
		$('#average').text(average + ' сек');
		$('#d-end').show();
	  }
	}, 1000);
		var words = [];
	{/literal}
		{section name=word loop=$words}
	{literal}
	
words.push( ["{/literal}{$words[word].word}{literal}", "{/literal}{$words[word].def}{literal}"]);
     {/literal}
		{/section}
	{literal}
	
	
	function add_word() {
		var word = $('#new_word').val();
		var def = $('#new_def').val();
		var word_ru = $('#new_word_ru').val();
		var level = document.querySelector('input[name="level"]:checked').value;
		
		$.ajax({
			type: "POST",
			url: "../resources/kw_add_word.php",
			data: {word:word, word_ru:word_ru, def:def, level:level },
			
			success: function(data){
				$('#new_word').val('');
				$('#new_word_ru').val('');
				$('#new_def').val('');
			},
			error: function(data){
				$('#geometry').text(data);
			}
			
			
		});
	}
	var i = 0;
	var correct = 0;
	{/literal}
	{if $page eq "start"}
	{literal}
	$('#inputWord').attr('placeholder', 'Начинается на ' + words[i][0].charAt(0).toUpperCase());
	
	$('#definitionWord').text(words[i][1]);
	
	$('#inputWord').on( 'keyup', function(){
		var input = $('#inputWord').val();
		var len = input.length;
		var pos = len - 1;
		var word = words[i][0];
		
		if (len >= 1){
			if (input == word.substr(0, len)){
				$('#progress-bar').attr({'style': 'width: ' + (100 / words[i][0].length) * len + '%',
										'class' : 'progress-bar bg-success'
				});
				
			}
			else {
				$('#progress-bar').attr({'style' : 'width: 100%', 
										'class' : 'progress-bar bg-danger'
					});
			}
		} else {
			$('#progress-bar').attr('style', 'width: 0%')
		}
		
		if (len == word.length && input.toLowerCase() == word.toLowerCase()){
			next_word();
			correct++;
		}
		/* $('#definitionWord').append(len);
		if(input == words[i][0].charAt(0)){
			$('#definitionWord').append('Правильно');
		}
		*/
	});
	{/literal}
	{/if}
	{literal}
	
	function rus() {
	  // Get the checkbox
	  var checkBox = document.getElementById("langRu");
	  // Get the output text

	  // If the checkbox is checked, display the output text
	  if (checkBox.checked == true){
		$('#a_easy').attr('href', 'index.php?l=easy&lang=ru');
		$('#a_middle').attr('href', 'index.php?l=middle&lang=ru');
		$('#a_hard').attr('href', 'index.php?l=hard&lang=ru');
	  } else {
		text.style.display = "none";
	  }
	}
	
	function next_word(){
		i++;
		$('#inputWord').val('');
		$('#inputWord').attr('placeholder', 'Начинается на ' + words[i][0].charAt(0).toUpperCase());
		$('#definitionWord').text(words[i][1]);
		$('#progress-bar').attr('style', 'width: 0%');
		$('#inputWord').focus();
		$('#d-def').animate({scrollTop:0},0);
		
	}
	function skip(){
		$('#inputWord').val(words[i][0]);
		setTimeout(function(){ next_word(); }, 700);
	}
	
	var hint = 3;
	function hint(){
		$('#inputWord').val(words[i][0].substr(0, 2));
		hint--;
		$('#s-hint').text(hint);
		if (hint == 0){
			$('#b-hint').attr('disabled', 'disabled');
		}
	}
	
	$(document).keyup(function(e) {
     if (e.key === "Escape") { 
		 skip();
	 }
	});
	
	
	
	
	
	</script>
   {/literal}
  </body>
</html>
