Puppet::Functions.create_function(:'carbon_c_relay_sorted') do
  dispatch :main do
    optional_param 'Hash', :unsorted
    optional_param 'Integer', :start
  end

  def main(unsorted={}, start=0)
    unsorted.keys.sort {
      |a,b| (b.include? a) ? 1 : (a <=> b)
    }.each_with_index do |key, index|
      unsorted[key][:order] = start + index
    end

    return unsorted
  end
end
