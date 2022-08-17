png(filename = 'plot1.png', width = 480, height = 480)

with(consumption_df, 
     hist(Global_active_power, 
          col = 'red', 
          xlab = 'Global Active Power (kilowatts)', 
          ylab = 'Frecuency', 
          main = 'Global Active Power'
     )
)

dev.off()
