const categories = [ ".category-guess-red", ".category-guess-purple", ".category-guess-blue", ".category-guess-yellow", ".in-game-player-button-blue", ".in-game-player-button-yellow", ".in-game-player-button-purple", ".in-game-player-button-green", ".in-game-player-button-red", ]

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
