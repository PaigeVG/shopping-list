# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShoppingList.Repo.insert!(%ShoppingList.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ShoppingList.Repo
alias ShoppingList.ShoppingLists.Item
alias ShoppingList.ShoppingLists.List
alias ShoppingList.ShoppingLists.ListItem
alias ShoppingList.Accounts.User

items = [
  %Item{name: "apple", section: "produce"},
  %Item{name: "beef", section: "meat"},
  %Item{name: "carrot", section: "produce"},
  %Item{name: "starfruit", section: "produce"},
  %Item{name: "strawberry", section: "produce"},
  %Item{name: "celery", section: "produce"},
  %Item{name: "chicken", section: "meat"},
  %Item{name: "pufferfish", section: "seafood"},
  %Item{name: "shrimp", section: "seafood"},
  %Item{name: "hot sauce", section: "dry goods"},
  %Item{name: "ginger root", section: "produce"}
]

Enum.each(items, &Repo.insert!/1)

user =
  %User{}
  |> User.changeset(%{username: "steven", encrypted_password: "123456"})
  |> Repo.insert!()

list1 = Repo.insert!(%List{name: "steven's list", user: user})
list2 = Repo.insert!(%List{name: "steven's second list", user: user})
list3 = Repo.insert!(%List{name: "steven's spooky list", user: user})

list_items = [
  %ListItem{item_name: "apple", quantity: 10, list: list1},
  %ListItem{item_name: "beef", quantity: 3, list: list1},
  %ListItem{item_name: "chicken", quantity: 1, list: list1},
  %ListItem{item_name: "starfruit", quantity: 5, list: list1},
  %ListItem{item_name: "celery", quantity: 100, list: list1},
  %ListItem{item_name: "carrot", quantity: 2, list: list1},
  %ListItem{item_name: "shrimp", quantity: 24, list: list2},
  %ListItem{item_name: "beef", quantity: 2, list: list2},
  %ListItem{item_name: "strawberry", quantity: 12, list: list2},
  %ListItem{item_name: "pufferfish", quantity: 15, list: list3},
  %ListItem{item_name: "hot sauce", quantity: 3, list: list3},
  %ListItem{item_name: "starfruit", quantity: 6, list: list3},
  %ListItem{item_name: "ginger root", quantity: 1, list: list3}
]

Enum.each(list_items, &Repo.insert!/1)
