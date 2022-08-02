class FileValidator < ActiveModel::EachValidator

    def validate_each(record, attribue, value)
        if value
            if value.respond_to? :path
                unless options[:ext].include? File.extname(value.path).delete('.').to_sym
                
                    record.errors[attribue] << "is not a valid File #{options[:ext].join(',')})"
                end

                else
                record.errors[attribute] << (options[:message] ||'is not a file')
                end
            end


    end

end