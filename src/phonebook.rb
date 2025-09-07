class PhoneBook
  def initialize
    @entries = {}
  end

  def add(name, number, is_listed)
    # if name already exists
    return false if @entries.key?(name)

    return false unless number.match?(/^\d{3}-\d{3}-\d{4}$/)

    # number can be listed only once
    if is_listed
      return false if @entries.values.any? { |e| e[:number] == number && e[:is_listed] }
    end

    @entries[name] = { number: number, is_listed: is_listed }
    true
  end

  def lookup(name)
    entry = @entries[name]
    return nil if entry.nil?
    entry[:is_listed] ? entry[:number] : nil
  end

  def lookupByNum(number)
    entry = @entries.find { |_, v| v[:number] == number && v[:is_listed] }
    entry ? entry[0] : nil
  end

  def namesByAc(areacode)
    @entries.select { |_, v| v[:number].start_with?(areacode) }.keys
  end
end
