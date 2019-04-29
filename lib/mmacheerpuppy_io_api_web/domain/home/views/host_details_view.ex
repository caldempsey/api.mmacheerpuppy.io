defmodule MmacheerpuppyIoApiWeb.HostDetailsView do
  use MmacheerpuppyIoApiWeb, :view

  def render("index.json", conn) do
    IO.inspect(conn)
    # Alternatively consider render/3
    %{data: conn.data}
  end
end
