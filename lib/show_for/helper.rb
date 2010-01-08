module ShowFor
  module Helper
    # Creates a div around the object and yields a builder.
    #
    # Example:
    #
    #   show_for @user do |f|
    #     f.attribute :name
    #     f.attribute :email
    #   end
    #
    def show_for(object, html_options={}, &block)
      tag = html_options.delete(:show_for_tag) || ShowFor.show_for_tag

      html_options[:id]  ||= dom_id(object)
      html_options[:class] = "show_for #{dom_class(object)} #{html_options[:class]}".strip

      content_tag(tag, yield(ShowFor::Builder.new(object, self)), html_options)
    end
  end
end

ActionView::Base.send :include, ShowFor::Helper