module Skeevy
  module Engines
    class Redis
      include Skeevy::Engine
      require 'redis'

      attr_reader :redis

      def initialize(instance: nil, host: 'localhost', port: 6379, db_num: 1)
        raise ArgumentError,
              "Instance passed was not a Skeevy::Instance" unless
            instance.is_a?(Skeevy::Instance) || instance.nil?
        @instance = instance
        @redis = ::Redis.new(host: host, port: port, db: db_num)
      end

      def exist?(key:)
        redis.exists key
      end

      def read(key:)
        redis.get key
      end

      def write!(key:, content:)
        redis.set key, content
      end

      def delete!(key:)
        result = redis.del key
        !!result
      end

      def keys
        redis.keys
      end
    end
  end
end

