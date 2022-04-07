function load_dotenv
  set -l file ".env"
  if test -e $file
    for line in (cat $file)
      if ! string match -q -r '^#.*' $line
        if string match -q -r "\S" $line
          set -l k  (echo $line | cut -d = -f 1)
          set -l v (echo $line | cut -d = -f 2-)
          set -xg $k $v
        end
      end
    end
  end
end
