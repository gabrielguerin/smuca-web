# -*- encoding: utf-8 -*-
# stub: administrate-field-active_storage 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "administrate-field-active_storage".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Hamad AlGhanim".freeze]
  s.date = "2022-03-31"
  s.description = "Administrate fields for active storage".freeze
  s.email = ["hamadyalghanim@gmail.com".freeze]
  s.homepage = "https://github.com/Dreamersoul/administrate-field-active_storage".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Administrate fields for active storage".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<administrate>.freeze, [">= 0.2.2"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 7.0"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<i18n-tasks>.freeze, ["~> 0.9.34"])
  else
    s.add_dependency(%q<administrate>.freeze, [">= 0.2.2"])
    s.add_dependency(%q<rails>.freeze, [">= 7.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
    s.add_dependency(%q<i18n-tasks>.freeze, ["~> 0.9.34"])
  end
end
