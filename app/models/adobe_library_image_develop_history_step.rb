class AdobeLibraryImageDevelopHistoryStep < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'Adobe_libraryImageDevelopHistoryStep'

  def self.popular_develop_steps(limit = history_steps.count)
    frequencies = calculate_frequencies(history_steps)

    frequencies[0..(limit - 1)].map do |step|
      {
        develop_step: step.first,
        frequency: step.second
      }
    end
  end

  def self.popular_develop_steps_with_adjustments(limit)
    frequencies = calculate_frequencies(history_steps_with_adjustments)

    frequencies[0..(limit - 1)].map do |step|
      {
        develop_step: step.first.first,
        adjustment: step.first.second,
        frequency: step.second
      }
    end
  end

  private

  def self.history_steps
    AdobeLibraryImageDevelopHistoryStep.pluck(:name).compact
  end

  def self.history_steps_with_adjustments
    steps = AdobeLibraryImageDevelopHistoryStep.pluck(:name, :relValueString).compact

    steps.reject { |step| step.second.nil? }
  end
end