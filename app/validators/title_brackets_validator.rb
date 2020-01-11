class TitleBracketsValidator < ActiveModel::Validator
  BRACKETS = { '}' => '{', ']' => '[', ')' => '(' }

  def validate(record)
    stack = []
    opening_brackets = BRACKETS.values
    closing_brackets = BRACKETS.keys
    empty = false

    record.title.each_char do |ch|
      if opening_brackets.include?(ch)
        empty = true
        stack.push(ch)
      elsif closing_brackets.include?(ch)
        if empty
          record.errors[:title] << 'Brackets cannot be empty'
          break
        end
        if stack.empty? || BRACKETS[ch] != stack.pop
          record.errors[:title] << 'Brackets do not match'
          break
        end
      else
        empty = false
      end
    end

    unless stack.empty?
      record.errors[:title] << 'Brackets do not match'
    end
  end
end
