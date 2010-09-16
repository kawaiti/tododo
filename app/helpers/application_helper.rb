module ApplicationHelper

  def observe_field(target, options = {})
    url       = options[:url] || options["url"]
    function  = options[:function] || options["function"]
    frequency = options[:frequency] || options["frequency"]
    update    = options[:update] || options["update"]
    with      = options[:with] || options["with"]

    script = <<EOL
    :javascript
    jQuery(function($) {
      $("##{target.to_s}").change(function() {
        $.post("#{url}", function(data) {
          $("##{update}").html(data);
        });
      });
    })
EOL

    return script
  end
end
