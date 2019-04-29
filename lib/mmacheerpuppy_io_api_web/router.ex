defmodule MmacheerpuppyIoApiWeb.Router do
  use MmacheerpuppyIoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MmacheerpuppyIoApiWeb do
    pipe_through :api
    resources "/host_details", HostDetailsController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MmacheerpuppyIoApiWeb do
  #   pipe_through :api
  # end
end
