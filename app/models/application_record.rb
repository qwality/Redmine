class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_save :filter_profane_words

  # @note pro vsechny String atributy v modelu zkontroluje, zda neobsahuji sprosta slova
  def filter_profane_words
    contains_profane_words = false
    self.attributes.each do |attribute, value|
      if value.is_a?(String) and Obscenity.profane?(value)
        errors.add(attribute, "obsahuje sprostá slova.")
        contains_profane_words = true
      end
    end
    throw(:abort) if contains_profane_words
  end
end
