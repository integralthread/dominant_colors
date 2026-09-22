defmodule DominantColors do
  use Rustler,
    otp_app: :dominant_colors,
    crate: "dominantcolors"

  def dominant_colors(_file_name), do: :erlang.nif_error(:nif_not_loaded)
end
