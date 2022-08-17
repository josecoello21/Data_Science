png(filename = 'plot2.png', width = 480, height = 480)

with(consumption_df,
     plot(date, Global_active_power, 
          type = 'l',
          ylab = 'Global Active Power (kilowatts)')
)

dev.off()
