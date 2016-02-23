class DisruptionDecorator < ApplicationDecorator
  decorates 'Disruption'
  delegate_all

  def as_json(*)
    model.as_json(methods: :coordinates_LL)
  end
end