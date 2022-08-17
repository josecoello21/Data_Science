png(filename = 'plot4.png', width = 480, height = 480)

par(mfcol = c(2,2))
with(consumption_df, {
    plot(date, Global_active_power, 
         type = 'l',
         xlab = '',
         ylab = 'Global Active Power')
    plot(date, Sub_metering_1, type="l",
         xlab = '',
         ylab="Energy sub metering")
    lines(date, Sub_metering_2, col='Red')
    lines(date, Sub_metering_3, col='Blue')
    legend("topright", 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1, lwd = 2)
    plot(date, Voltage, 
         type = 'l',
         xlab = 'datetime')
    plot(date, Global_reactive_power, 
         type = 'l',
         xlab = 'datetime')
})

dev.off()
