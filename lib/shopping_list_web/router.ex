defmodule ShoppingListWeb.Router do
  use ShoppingListWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShoppingListWeb do
    pipe_through :browser

    get "/", PageController, :index

    post "/list", ListController, :create
    get "/list", ListController, :index

    resources "/lists", ListController do
      put "/list_items/:id/toggle", ListItemController, :toggle_obtained
      resources "/list_items", ListItemController
    end

    resources "/items", ItemController
    resources "/registrations", UserController, only: [:create, :new]

    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create
    delete "sign_out", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShoppingListWeb do
  #   pipe_through :api
  # end
end
