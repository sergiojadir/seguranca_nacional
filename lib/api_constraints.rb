class ApiConstraints
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matches?(request)
		@default || request.headers.fetch(:accept).include?("application/vnd.cadusu.v#{@version}")
	end
end