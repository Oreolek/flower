converter = new Showdown.converter()
undum.game.id = "7f7e611e-1276-11e4-beaf-afabc89d7876"
undum.game.version = "1.0"

undum.game.situations =
  start:      new undum.SimpleSituation(
    converter.makeHtml("""
    Солнечный день, горная деревня. Маленький мальчик по имени Вова собирает букет цветов для мамы.
    """),
    {
      choices: "#flowers",
      optionText: "Какой цветок он добавит к букету?"
    }
  ),

  cornflower: new undum.SimpleSituation(
    converter.makeHtml("""
    Вася наклоняется и срывает фиолетовый цветочек. Мама любит васильки.
    """),
    {
      tags: "flowers",
      choices: "#flowers",
      optionText: "Василёк"
      enter: (character, system, from) ->
        character.qualities.chose_flowers = character.qualities.chose_flowers + 1
        if character.qualities.chose_flowers == 2
          system.setQuality("flower_chosen", "cornflower")
          system.doLink("tourist")
    }
  ),

  camomile: new undum.SimpleSituation(
    converter.makeHtml("""
    Теперь в букетике есть ромашка.
    """),
    {
      tags: "flowers",
      choices: "#flowers",
      optionText: "Ромашка"
      enter: (character, system, from) ->
        character.qualities.chose_flowers = character.qualities.chose_flowers + 1
        if character.qualities.chose_flowers == 2
          system.setQuality("flower_chosen", "camomile")
          system.doLink("tourist")
    }
  ),

  dandelion: new undum.SimpleSituation(
    converter.makeHtml("""
    Жёлтый одуванчик &mdash; ничего необычного, но он сделает букетик ярче.
    """),
    {
      tags: "flowers",
      choices: "#flowers",
      optionText: "Одуванчик"
      enter: (character, system, from) ->
        character.qualities.chose_flowers = character.qualities.chose_flowers + 1
        if character.qualities.chose_flowers == 2
          system.setQuality("flower_chosen", "dandelion")
          system.doLink("tourist")
    }
  ),

  tourist: new undum.SimpleSituation(
    converter.makeHtml("""
    Но прежде чем Вова закончит букетик, я должен рассказать про другого героя.
   
    На вершине высокой горы стоит альпинист. Он смотрит на облака, на горы, на горизонт, на деревню внизу.
    """)
  ),

undum.game.init = (character, system) ->
  character.qualities.chose_flowers = 0
  character.qualities.flower_chosen = ""
