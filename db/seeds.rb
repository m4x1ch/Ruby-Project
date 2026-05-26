Value.delete_all
Image.delete_all
Theme.delete_all
User.delete_all

Theme.create([
  {
    name: "Полутвёрдые сыры",
    qty_items: 5
  },
  {
    name: "Твёрдые сыры",
    qty_items: 5
  },
  {
    name: "Мягкие сыры",
    qty_items: 5
  }
])

Image.create([

  # Полутвёрдые

  {
    name: "Гауда",
    file: "gouda.jpg",
    ave_value: 0,
    theme_id: 1
  },
  {
    name: "Эдам",
    file: "edam.jpg",
    ave_value: 0,
    theme_id: 1
  },
  {
    name: "Маасдам",
    file: "maasdam.jpg",
    ave_value: 0,
    theme_id: 1
  },
  {
    name: "Тильзитер",
    file: "tilsit.jpg",
    ave_value: 0,
    theme_id: 1
  },
  {
    name: "Чеддер",
    file: "cheddar.jpg",
    ave_value: 0,
    theme_id: 1
  },

  # Твёрдые

  {
    name: "Пармезан",
    file: "parmesan.jpg",
    ave_value: 0,
    theme_id: 2
  },
  {
    name: "Грана Падано",
    file: "grana_padano.jpg",
    ave_value: 0,
    theme_id: 2
  },
  {
    name: "Пекорино",
    file: "pecorino.jpg",
    ave_value: 0,
    theme_id: 2
  },
  {
    name: "Эмменталь",
    file: "emmental.jpg",
    ave_value: 0,
    theme_id: 2
  },
  {
    name: "Конте",
    file: "comte.jpg",
    ave_value: 0,
    theme_id: 2
  },

  # Мягкие

  {
    name: "Бри",
    file: "brie.jpg",
    ave_value: 0,
    theme_id: 3
  },
  {
    name: "Камамбер",
    file: "camembert.jpg",
    ave_value: 0,
    theme_id: 3
  },
  {
    name: "Моцарелла",
    file: "mozzarella.jpg",
    ave_value: 0,
    theme_id: 3
  },
  {
    name: "Дорблю",
    file: "dorblu.jpg",
    ave_value: 0,
    theme_id: 3
  },
  {
    name: "Рикотта",
    file: "ricotta.jpg",
    ave_value: 0,
    theme_id: 3
  }
])

User.create([
  {
    name: "Admin",
    email: "admin@example.com"
  }
])