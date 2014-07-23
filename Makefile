all:
	lessc style.less >style.css
	coffee -c js/game.coffee
