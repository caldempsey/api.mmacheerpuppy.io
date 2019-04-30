defmodule MmacheerpuppyIoApi.IPInfo do
  alias MmacheerpuppyIoApi.IPInfo
  defstruct ip: "127.0.0.1", city: "Toronto", region: "Canada"

  @spec resolve_location(
          {byte(), byte(), byte(), byte()}
          | {char(), char(), char(), char(), char(), char(), char(), char()}
        ) ::
          nil
          | %{
              :__struct__ => HTTPoison.AsyncResponse | HTTPoison.Response,
              optional(:body) => any(),
              optional(:headers) => [any()],
              optional(:id) => reference(),
              optional(:request) => HTTPoison.Request.t(),
              optional(:request_url) => any(),
              optional(:status_code) => integer()
            }

  def resolve_location(ipv4) when is_tuple(ipv4) do
    headers = [{"Accept", "application/json"}]
    params = [token: Application.get_env(:app_name, AppName.Endpoint)[:api_prefix]]
    response = HTTPoison.get("ipinfo.io/" <> to_string(:inet.ntoa(ipv4)), headers, params: params)

    with {:ok, ipinfo = %IPInfo{}} <-
           response
           |> Jason.decode()
           |> Map.get(:body) do
      ipinfo
    end

    # :error
  end
end
