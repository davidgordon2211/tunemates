const categories = [ ".category-guess-red", ".category-guess-purple", ".category-guess-blue", ".category-guess-yellow", ".in-game-player-button-Blue", ".in-game-player-button-Yellow", ".in-game-player-button-Purple", ".in-game-player-button-Green", ".in-game-player-button-Red", ]

const turnActive = (categories) => {
  categories.forEach((category) => {
    const cards = Array.from(document.querySelectorAll(category));
    cards.forEach((card) => {
      card.addEventListener("click", (e) => {
        event.currentTarget.classList.toggle("active");
      })
    })
  })
}

turnActive(categories);
