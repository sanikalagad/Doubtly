import { BrowserRouter, Link, Route, Routes } from 'react-router-dom'
import './App.css'

const navItems = [
  { path: '/', label: 'Dashboard' },
  { path: '/questions', label: 'Questions' },
  { path: '/categories', label: 'Categories' },
  { path: '/study-groups', label: 'Study Groups' },
  { path: '/chat', label: 'Chat' },
  { path: '/rewards', label: 'Rewards' },
  { path: '/profile', label: 'Profile' },
]

function Placeholder({ title }) {
  return (
    <main className="page">
      <h1>{title}</h1>
      <p>This page is under construction.</p>
    </main>
  )
}

export default function App() {
  return (
    <BrowserRouter>
      <header className="app-header">
        <Link to="/" className="brand">Doubtly</Link>
        <nav>
          {navItems.map((item) => (
            <Link key={item.path} to={item.path}>{item.label}</Link>
          ))}
        </nav>
        <div className="auth-links">
          <Link to="/login">Log in</Link>
          <Link to="/register">Sign up</Link>
        </div>
      </header>

      <Routes>
        <Route path="/" element={<Placeholder title="Dashboard" />} />
        <Route path="/questions" element={<Placeholder title="Questions" />} />
        <Route path="/categories" element={<Placeholder title="Categories" />} />
        <Route path="/study-groups" element={<Placeholder title="Study Groups" />} />
        <Route path="/chat" element={<Placeholder title="Chat" />} />
        <Route path="/rewards" element={<Placeholder title="Rewards" />} />
        <Route path="/profile" element={<Placeholder title="Profile" />} />
        <Route path="/login" element={<Placeholder title="Log in" />} />
        <Route path="/register" element={<Placeholder title="Sign up" />} />
      </Routes>
    </BrowserRouter>
  )
}
