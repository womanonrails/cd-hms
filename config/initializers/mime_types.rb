Mime::Type.register 'application/vnd.api+json', :jsonapi

ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::JSONAPI] = lambda do |body|
  JSON.parse body
end

ActionController::Renderers.add :json_api do |object, _|
  self.content_type ||= Mime[:json_api]
  object
end
