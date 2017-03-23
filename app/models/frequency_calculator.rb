module FrequencyCalculator
  def calculate_frequencies(data)
    frequencies = frequencies(data)
    sort_by_frequency(frequencies)
  end

  def calculate_year_frequencies(data)
    frequencies = frequencies(data)
    sort_by_year(frequencies)
  end

  private

  def frequencies(data)
    frequencies = {}

    data.each do |item|
      if frequencies.has_key?(item)
        frequencies[item] += 1
      else
        frequencies[item] = 1
      end
    end

    frequencies
  end

  def sort_by_year(data)
    filtered = data.delete_if { |camera_year, frequency| camera_year.second.nil? }

    filtered.sort_by { |camera_year, frequency| camera_year.second }
  end

  def sort_by_frequency(data)
    data.sort_by { |item, frequency| frequency }.reverse
  end
end
