defmodule MmacheerpuppyIoApi.IPInfo do
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
    headers = [{"Content-type", "application/json"}]
    params = [token: Application.get_env(:app_name, AppName.Endpoint)[:api_prefix]]

    case with {:ok, %{ip: ip, city: city, region: region}} <-
                HTTPoison.get("ipinfo.io/" <> to_string(:inet.ntoa(ipv4)), headers, params: params),
              do: {:ok, %{ip: ip, city: city, region: region}} do
      {:ok, request} ->
        request

      {:error, _} ->
        nil
    end
  end
end
