def history
   history = Readline::HISTORY.entries
   puts history[0..-2].join("\n") unless history.nil?
end
