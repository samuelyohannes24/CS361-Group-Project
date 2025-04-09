function calculateRisk(likelihood, impact, lastSeen) {
  const now = new Date();
  const lastSeenDate = new Date(lastSeen);
  const daysSinceLastSeen = Math.floor((now - lastSeenDate) / (1000 * 60 * 60 * 24));
  const decayFactor = Math.max(0.1, 1 - (0.05 * daysSinceLastSeen));
  const riskScore = (likelihood * impact) * decayFactor;
  return riskScore.toFixed(2);
}

// Example usage
const likelihood = 4;
const impact = 5;
const lastSeen = '2025-03-20';
const riskScore = calculateRisk(likelihood, impact, lastSeen);
console.log(`Updated Risk Score: ${riskScore}`);
