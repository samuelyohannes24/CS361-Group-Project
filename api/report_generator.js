const PDFDocument = require('pdfkit');
const fs = require('fs');

function generateThreatReport(threats) {
  const doc = new PDFDocument();
  const filename = `threat_report_${new Date().toISOString().split('T')[0]}.pdf`;
  doc.pipe(fs.createWriteStream(filename));

  doc.fontSize(20).text('Threat Intelligence Report', { align: 'center' }).moveDown();

  threats.forEach(({ name, score, mitigation }) => {
    doc.fontSize(12).text(`Threat: ${name}`);
    doc.text(`Risk Score: ${score}`);
    doc.text(`Mitigation: ${mitigation}\n`).moveDown();
  });

  doc.end();
  console.log(`Report saved as ${filename}`);
}

// Example usage
generateThreatReport([
  { name: 'SQL Injection', score: 25, mitigation: 'Sanitize inputs & use parameterized queries' },
  { name: 'XSS Attack', score: 20, mitigation: 'Use CSP and escape output' }
]);

//bash : npm install pdfkit

