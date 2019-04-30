defmodule MmacheerpuppyIoApiWeb.HostDetailsController do
  use MmacheerpuppyIoApiWeb, :controller
  alias MmacheerpuppyIoApi.IPInfo

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    case IPInfo.resolve_location(conn.remote_ip) do
      :error ->
        render(conn, "index.json", %{data: []})

      host_data ->
        render(conn, "index.json", %{data: host_data})
    end
  end
end
