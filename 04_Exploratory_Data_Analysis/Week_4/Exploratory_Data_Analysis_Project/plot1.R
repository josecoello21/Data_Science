# load data
NEI <- readRDS("summarySCC_PM25.rds")

png("Plot_1.png", width = 480, height = 480)

barplot(height = tapply(NEI$Emissions, NEI$year, FUN = sum)/1000,
        ylab = 'PM2.5 Emissions (10^3)',
        xlab = 'Years',
        main = 'Total PM2.5 Emissions for years in USA')

dev.off()
