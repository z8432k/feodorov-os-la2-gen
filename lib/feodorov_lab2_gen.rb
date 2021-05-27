# frozen_string_literal: true

require 'yaml'
require "erb"
require 'active_support'
require 'active_support/core_ext'


require_relative "feodorov_lab2_gen/version"

module FeodorovLab2Gen
  class Error < StandardError; end
  # Your code goes here...

  class << self
    def generate
      cfg = YAML.load_file("lib/examples/task15.yml")
                .deep_symbolize_keys!

      tpl = ERB.new(File.read('lib/tpl/lab2.c.erb'))

      ids = cfg[:threads].keys.map(&:to_s).map(&:swapcase)

      barriers_cnt = cfg[:barriers].times.map do |b|
        i = 0
        cfg[:threads].each do |k, v|
          start_at = v[:start_at]
          end_at = v[:end_at]

          if start_at == b + 1 || end_at == b + 1
            i += 1
          end

          if (end_at - start_at).abs > 1
            v[:pause] = start_at.nil? ? 0 : start_at
          end
        end

        i
      end

      cfg[:threads].each do |k, v|
        start_at = v[:start_at]
        end_at = v[:end_at]

        if (end_at - start_at).abs > 1
          v[:pause] = start_at.nil? ? 0 : start_at

          while (end_at -= 1) > start_at do
            idx = end_at - 1
            barriers_cnt[idx] += 1
          end

        end
      end

      out = tpl.result_with_hash({
        task_id: cfg[:task],
        nosync: cfg[:nosync],
        sync: cfg[:sync],
        ids: ids,
        number_of: ids.size,
        threads: cfg[:threads],
        barriers: cfg[:barriers],
        barriers_cnt: barriers_cnt
      })

      File.open("tmp/lab2.c", "w") do |f|
        f.puts out
      end
    end
  end
end
