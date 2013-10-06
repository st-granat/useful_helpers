# -*- encoding: utf-8 -*-

module Untransliterate
  RV_LOWER_SINGLE = {
    "і"=>"i","ґ"=>"g","ё"=>"yo","№"=>"#","є"=>"e",
    "ї"=>"yi","а"=>"a","б"=>"b",
    "в"=>"v","г"=>"g","д"=>"d","е"=>"e","ж"=>"zh",
    "з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l",
    "м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
    "с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
    "ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"'",
    "ы"=>"y","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya",
  }.invert

  RV_LOWER_MULTI = {
    # "ье"=>"ie",
    # "ьё"=>"ie",
  }.invert

  RV_UPPER_SINGLE = {
    "Ґ"=>"G","Ё"=>"YO","Є"=>"E","Ї"=>"YI","І"=>"I",
    "А"=>"A","Б"=>"B","В"=>"V","Г"=>"G",
    "Д"=>"D","Е"=>"E","Ж"=>"ZH","З"=>"Z","И"=>"I",
    "Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N",
    "О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T",
    "У"=>"U","Ф"=>"F","Х"=>"H","Ц"=>"TS","Ч"=>"CH",
    "Ш"=>"SH","Щ"=>"SCH","Ъ"=>"'","Ы"=>"Y","Ь"=>"",
    "Э"=>"E","Ю"=>"YU","Я"=>"YA",
  }.invert

  RV_UPPER_MULTI = {
    # "ЬЕ"=>"IE",
    # "ЬЁ"=>"IE",
  }.invert

  RV_LOWER = (LOWER_SINGLE.merge(RV_LOWER_MULTI)).freeze
  RV_UPPER = (UPPER_SINGLE.merge(RV_UPPER_MULTI)).freeze
  RV_MULTI_KEYS = (LOWER_MULTI.merge(RV_UPPER_MULTI)).keys.sort_by {|s| s.length}.reverse.freeze

  # Transliterate a string with russian characters
  #
  # Возвращает строку, в которой все буквы русского алфавита заменены на похожую по звучанию латиницу
  def self.run(str)
    chars = str.scan(%r{#{RV_MULTI_KEYS.join '|'}|\w|.})

    result = ""

    chars.each_with_index do |char, index|
      if RV_UPPER.has_key?(char) && RV_LOWER.has_key?(chars[index+1])
        # combined case
        result << RV_UPPER[char].downcase.capitalize
      elsif UPPER.has_key?(char)
        result << RV_UPPER[char]
      elsif LOWER.has_key?(char)
        result << RV_LOWER[char]
      else
        result << char
      end
    end

    result
  end
end
