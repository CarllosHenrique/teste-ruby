# app/services/payments_registry.rb
module PaymentsRegistry
  extend self

  def all
    Rails.autoloaders.main.eager_load_dir(Rails.root.join("app/payments"))
    return [] unless defined?(::Payments::Base)

    ::Payments::Base.descendants
                    .select { |k| k.is_a?(Class) }
                    .sort_by!(&:label)
  end

  def options_for_select = all.map { |k| [human_label(k), k.key] }

  def fetch(key) = all.find { |k| k.key == key } || raise("Payment '#{key}' not found")

  def label_for(key)
    klass = fetch(key)
    human_label(klass)
  end

  private

  def human_label(klass)
    I18n.t("payments.methods.#{klass.key}", default: klass.label)
  end
end
