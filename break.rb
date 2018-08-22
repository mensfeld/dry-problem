require 'dry-validation'

schema1 = Dry::Validation.Schema do
  optional('params').schema do
    optional('name').maybe(:str?)

    validate(deprecated?: 'name') { |name| name.nil? }
  end
end

p schema1.call({ 'name' => 'a' })

schema2 = Dry::Validation.Schema do
  optional('params').schema do
    optional('name').maybe(:str?)

    validate(deprecated?: 'name', &:nil?)
  end
end

p schema2.call({ 'params' => { 'name' => 'a' } })
