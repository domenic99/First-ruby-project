class CheckRecord
  def initialize(record)
    @record = record
  end

  def result
    if @record != nil
      if @record.delete_type == 0 && @record.count != 0  
        @record.update(:count => @record.count - 1)
        AESCrypt.decrypt(@record.message, "p4ssw0rd")  
      elsif Time.now.to_i - @record.time.to_i <= 3600*@record.count
        AESCrypt.decrypt(@record.message, "p4ssw0rd")
      else
        @record.delete
        nil
      end  
    else
      nil
    end	
  end
end