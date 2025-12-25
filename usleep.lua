function usleep(s)
  if package.config:sub(1,1) == '\\' then
    os.execute("Powershell -Command \"Start-Sleep -Milliseconds " .. s * 1000 .. "\"")
  else
    os.execute("sleep " .. s)
  end
end

return usleep
