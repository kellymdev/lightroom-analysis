class AdobeLibraryImageDevelopHistoryStep < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'Adobe_libraryImageDevelopHistoryStep'

  def self.popular_develop_steps(limit)
    frequencies = calculate_frequencies(history_steps)

    frequencies[0..(limit - 1)].map do |step|
      {
        develop_step: step.first,
        frequency: step.second
      }
    end
  end

  private

  def self.history_steps
    AdobeLibraryImageDevelopHistoryStep.pluck(:name).compact
  end
end