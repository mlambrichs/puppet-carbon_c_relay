#
define carbon_c_relay::config::rewrite (
  $expression  = undef,
  $replacement = undef,
  $comments    = undef,
  $order       = $title,
){

  concat::fragment { "rewrite-${title}":
    target  => $carbon_c_relay::config_file,
    content => template('carbon_c_relay/config/rewrite.erb'),
    order   => $order
  }
}
