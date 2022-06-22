defmodule FrontEndChallengeWeb.PageController do
  use FrontEndChallengeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
