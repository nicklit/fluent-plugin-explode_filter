require 'fluent/filter'
require 'fluent/plugin_mixin/mutate_event'

module Fluent
  class ExplodeFilter < Filter
    Fluent::Plugin.register_filter('explode', self)

    def filter(tag, time, record)
      event = Fluent::PluginMixin::MutateEvent.new(record, false)
      event_data = Fluent::PluginMixin::MutateEvent.new({}, true)

      event.keys.each do |key|
        event_data.set(key, event.get(key))
      end

      event_data.to_record
    end
  end
end