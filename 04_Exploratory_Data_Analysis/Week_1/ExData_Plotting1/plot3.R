png(filename = 'plot3.png', width = 480, height = 480)

with(consumption_df, {
    plot(date, Sub_metering_1, type="l",
         ylab="Energy sub metering")
    lines(date, Sub_metering_2, col='Red')
    lines(date, Sub_metering_3, col='Blue')
    legend("topright", 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = 1, lwd = 2)
})

dev.off()
