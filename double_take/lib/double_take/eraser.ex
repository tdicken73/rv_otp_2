defmodule DoubleTake.Eraser do

  defstruct [
    score: 0,
    original_text: "I'll be back",
    text: "I'll be back",
    plan: [],
    name: "Arnold",
  ]

  def new(quotation) do
    text = quotation.text
    size = String.length(text)
    chunk_size = (size / quotation.steps) |> ceil()

    plan =
      1..size
      |> Enum.shuffle()
      |> Enum.chunk_every(chunk_size)

    %DoubleTake.Eraser{
      original_text: text,
      text: text,
      plan: plan,
      name: quotation.name,
    }
  end

  def erase(%__MODULE__{text: text, plan: [step | plan], score: score} = eraser, attempt) do
    new_score = eraser.score + String.length(attempt)
    new_text =
      text
      |> String.graphemes()
      |> Enum.with_index(1)
      |> Enum.map(&replace_character(&1, step))
      |> Enum.join()

    %{
      eraser |
      score: new_score,
      text: new_text,
      plan: plan
    }
  end

  def replace_character({ch, index}, step) do
    cond do
      ch in [" ", "'", ",", ".", "!", "\"", ";"] -> ch

      index in step -> "_"

      true -> ch
    end
  end
end
