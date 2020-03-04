defmodule HoaxEx do
  @def_opts [sex: :r, ]
  alias HoaxEx.Person

  def generate(opts \\ @def_opts) do
    opts
    |> Person.generate()
  end
end
