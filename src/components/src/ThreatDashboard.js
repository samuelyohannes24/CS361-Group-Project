import logo from './logo.svg';
import './ThreatDashboard.css';

function ThreatDashboard() {
    return (
        <div className="ThreatDashboard">
            <header className="ThreatDashboard-header">
                <h1>Real-Time Threat Intelligence</h1>
                <p>Live Threat Updates will be displayed here.</p>
                <img src={logo} className="ThreatDashboard-logo" alt="logo" />
                <p>
                    Edit <code>src/ThreatDashboard.js</code> and save to reload.
                </p>
                <a
                    className="ThreatDashboard-link"
                    href="https://reactjs.org"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    Learn React
                </a>
            </header>
        </div>
    );
}

export default ThreatDashboard;

// hello world