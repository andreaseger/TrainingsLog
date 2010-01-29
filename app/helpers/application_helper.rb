# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to(name, "javascript:void(0)", :class => "remove_child")
  end

  def add_child_link(name, association)
    link_to(name, "javascript:void(0)", :class => "add_child", :"data-association" => association)
  end
  
  def add_copy_paste_link(name, association)
    link_to(name, "javascript:void(0)", :class => "add_copy_paste", :"data-field" => association, :"data-clipboard" => name)
  end

  def new_child_fields_template(form_builder, association, options = {})
    content_for "#{association}_fields_template" do
      options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
      options[:partial] ||= association.to_s.singularize
      options[:form_builder_local] ||= :f

      content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
        form_builder.semantic_fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
          render(:partial => options[:partial], :locals => {options[:form_builder_local] => f})
        end
      end
    end unless content_given?("#{association}_fields_template")
  end

  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.nil?
  end
end

