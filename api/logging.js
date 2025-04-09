const fs = require('fs');
const path = require('path');
const winston = require('winston');

// Ensure logs directory exists
const logsDir = path.join(__dirname, '../logs');
if (!fs.existsSync(logsDir)) {
  fs.mkdirSync(logsDir);
}

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.printf(info => `${new Date().toISOString()} - ${info.message}`),
  transports: [
    new winston.transports.File({ filename: path.join(logsDir, 'threat_events.log') })
  ]
});

function logThreat(threat, riskScore) {
  logger.info(`${threat} detected with risk score: ${riskScore}`);
}

// Example usage
logThreat('DDoS Attack', 30);
logThreat('Phishing Attempt', 18);

// bash : npm install winston
