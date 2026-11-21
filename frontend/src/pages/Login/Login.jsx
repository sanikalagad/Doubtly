import React, { useEffect, useId, useRef, useState } from 'react'
import './Login.css'

const EMAIL_PATTERN = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

function validateField(name, value) {
  if (name === 'email') {
    if (!value.trim()) return 'Enter your email address.'
    if (!EMAIL_PATTERN.test(value.trim())) return 'Enter a valid email address, like you@example.com.'
  }
  if (name === 'password') {
    if (!value) return 'Enter your password.'
    if (value.length < 8) return 'Password must be at least 8 characters.'
  }
  return ''
}

function BrandMark() {
  return (
    <span className="login-brand">
      <svg className="login-brand__icon" viewBox="0 0 40 40" aria-hidden="true" focusable="false">
        <path d="M8 9.5A4.5 4.5 0 0 1 12.5 5h15A4.5 4.5 0 0 1 32 9.5v14a4.5 4.5 0 0 1-4.5 4.5H19l-8 6v-6h-.5A4.5 4.5 0 0 1 6 23.5V9.5Z" fill="currentColor" />
        <path d="M20 11.5a4.5 4.5 0 0 0-4.35 5.65l1.7-.45a2.7 2.7 0 1 1 3.8 2.6c-.7.33-1.15.95-1.15 1.7v.5h1.8v-.4c0-.35.2-.6.6-.8a4.5 4.5 0 0 0-2.4-8.6Z" fill="var(--color-primary)" />
        <circle cx="20" cy="23.7" r="1.3" fill="var(--color-primary)" />
      </svg>
      <span className="login-brand__name">Doubtly</span>
    </span>
  )
}

function MailIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <rect x="3" y="5" width="18" height="14" rx="3" />
      <path d="m4 7 8 6 8-6" />
    </svg>
  )
}

function LockIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <rect x="4" y="10" width="16" height="11" rx="3" />
      <path d="M8 10V7a4 4 0 0 1 8 0v3" />
    </svg>
  )
}

function EyeIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <path d="M2.5 12S6 5.5 12 5.5 21.5 12 21.5 12 18 18.5 12 18.5 2.5 12 2.5 12Z" />
      <circle cx="12" cy="12" r="3" />
    </svg>
  )
}

function EyeOffIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <path d="M3 3l18 18" />
      <path d="M10.6 6.1A9.8 9.8 0 0 1 12 6c6 0 9.5 6 9.5 6a16 16 0 0 1-3.3 3.9" />
      <path d="M6.4 7.6A16 16 0 0 0 2.5 12S6 18 12 18a9.7 9.7 0 0 0 3.3-.6" />
      <path d="M9.9 9.9a3 3 0 0 0 4.2 4.2" />
    </svg>
  )
}

function ArrowIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <path d="M5 12h14M13 6l6 6-6 6" />
    </svg>
  )
}

function AlertIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <circle cx="12" cy="12" r="9" />
      <path d="M12 8v5M12 16.5h.01" />
    </svg>
  )
}

function CheckIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
      <path d="m5 12.5 4.5 4.5L19 7" />
    </svg>
  )
}

function GoogleIcon() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
      <path fill="#4285F4" d="M21.6 12.23c0-.71-.06-1.24-.19-1.79H12v3.63h5.52a4.73 4.73 0 0 1-2.05 3.1v2.58h3.32c1.94-1.79 3.06-4.43 3.06-7.52Z" />
      <path fill="#34A853" d="M12 22c2.77 0 5.1-.92 6.79-2.49l-3.32-2.57c-.92.62-2.1.99-3.47.99-2.67 0-4.93-1.8-5.74-4.22H2.83v2.66A10 10 0 0 0 12 22Z" />
      <path fill="#FBBC05" d="M6.26 13.71a6 6 0 0 1 0-3.82V7.23H2.83a10 10 0 0 0 0 8.94l3.43-2.46Z" />
      <path fill="#EA4335" d="M12 6.04c1.51 0 2.86.52 3.93 1.55l2.95-2.95A9.6 9.6 0 0 0 12 2a10 10 0 0 0-9.17 5.23l3.43 2.66C7.07 7.84 9.33 6.04 12 6.04Z" />
    </svg>
  )
}

function GitHubIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false">
      <path d="M12 2a10 10 0 0 0-3.16 19.49c.5.09.68-.22.68-.48v-1.7c-2.78.6-3.37-1.34-3.37-1.34-.45-1.16-1.11-1.47-1.11-1.47-.91-.62.07-.61.07-.61 1 .07 1.53 1.03 1.53 1.03.9 1.53 2.34 1.09 2.91.83.09-.65.35-1.09.64-1.34-2.22-.25-4.55-1.11-4.55-4.94 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.27.1-2.64 0 0 .84-.27 2.75 1.02a9.5 9.5 0 0 1 5 0c1.91-1.29 2.75-1.02 2.75-1.02.55 1.37.2 2.39.1 2.64.64.7 1.03 1.59 1.03 2.68 0 3.84-2.34 4.68-4.57 4.93.36.31.68.92.68 1.86v2.76c0 .27.18.58.69.48A10 10 0 0 0 12 2Z" />
    </svg>
  )
}

/**
 * Doubtly sign-in page.
 * Pass `onSubmit`, `onGoogleSignIn`, and `onGitHubSignIn` to connect real auth.
 */
export default function Login({ onSubmit, onGoogleSignIn, onGitHubSignIn }) {
  const emailId = useId()
  const passwordId = useId()
  const rememberId = useId()
  const emailHintId = `${emailId}-hint`
  const emailErrorId = `${emailId}-error`
  const passwordErrorId = `${passwordId}-error`
  const summaryId = useId()

  const summaryRef = useRef(null)
  const timerRef = useRef(null)

  const [values, setValues] = useState({ email: '', password: '' })
  const [touched, setTouched] = useState({ email: false, password: false })
  const [errors, setErrors] = useState({ email: '', password: '' })
  const [remember, setRemember] = useState(false)
  const [showPassword, setShowPassword] = useState(false)
  const [status, setStatus] = useState('idle')
  const [notice, setNotice] = useState('')
  const [showSummary, setShowSummary] = useState(false)

  useEffect(() => () => window.clearTimeout(timerRef.current), [])

  useEffect(() => {
    if (showSummary) summaryRef.current?.focus()
  }, [showSummary])

  const fieldErrors = Object.entries(errors).filter(([, message]) => message)

  function describedBy(name, hasError) {
    if (name === 'email') return hasError ? `${emailHintId} ${emailErrorId}` : emailHintId
    return hasError ? passwordErrorId : undefined
  }

  function handleChange(name, value) {
    setValues((current) => ({ ...current, [name]: value }))
    if (touched[name]) {
      setErrors((current) => ({ ...current, [name]: validateField(name, value) }))
    }
  }

  function handleBlur(name) {
    setTouched((current) => ({ ...current, [name]: true }))
    setErrors((current) => ({ ...current, [name]: validateField(name, values[name]) }))
  }

  async function handleSubmit(event) {
    event.preventDefault()
    setShowSummary(false)

    const nextErrors = {
      email: validateField('email', values.email),
      password: validateField('password', values.password),
    }
    setErrors(nextErrors)
    setTouched({ email: true, password: true })

    if (nextErrors.email || nextErrors.password) {
      setNotice('Please fix the highlighted fields and try again.')
      setShowSummary(true)
      return
    }

    setNotice('')
    setStatus('loading')

    try {
      if (onSubmit) {
        await onSubmit({ email: values.email.trim(), password: values.password, remember })
      } else {
        await new Promise((resolve) => {
          timerRef.current = window.setTimeout(resolve, 700)
        })
      }
      setStatus('success')
      setNotice(
        onSubmit
          ? 'Signed in successfully.'
          : 'Demo mode: connect this form to your authentication API to sign in.',
      )
    } catch (error) {
      setStatus('error')
      setNotice(error?.message || 'We could not sign you in. Check your details and try again.')
      setShowSummary(true)
    }
  }

  async function handleSocial(handler) {
    if (!handler) {
      setStatus('error')
      setNotice('Demo mode: connect a social sign-in provider to continue.')
      setShowSummary(true)
      return
    }
    setStatus('loading')
    try {
      await handler()
      setStatus('success')
      setNotice('Signed in successfully.')
    } catch (error) {
      setStatus('error')
      setNotice(error?.message || 'Sign-in was cancelled. Try again or use your email.')
      setShowSummary(true)
    }
  }

  return (
    <div className="login-page">
      <aside className="login-showcase" aria-label="About Doubtly">
        <div className="login-showcase__glow login-showcase__glow--one" aria-hidden="true" />
        <div className="login-showcase__glow login-showcase__glow--two" aria-hidden="true" />

        <div className="login-showcase__content">
          <BrandMark />
          <h1>Good questions lead to great answers.</h1>
          <p>Ask anything, help someone out, and learn together with students who get it.</p>

          <div className="login-showcase__art" aria-hidden="true">
            <div className="login-art-card login-art-card--back">
              <span className="login-art-card__line login-art-card__line--short" />
              <span className="login-art-card__line" />
            </div>
            <div className="login-art-card login-art-card--front">
              <span className="login-art-avatar">A</span>
              <div className="login-art-card__body">
                <span className="login-art-card__label">New question</span>
                <span className="login-art-card__line" />
                <span className="login-art-card__line login-art-card__line--mid" />
              </div>
            </div>
            <div className="login-art-badge">
              <span className="login-art-badge__check"><CheckIcon /></span>
              <span>Answered by Maya <strong>+12 pts</strong></span>
            </div>
          </div>

          <ul className="login-showcase__features">
            <li>Ask without hesitation</li>
            <li>Get answers from peers</li>
            <li>Earn points as you help</li>
          </ul>
        </div>
      </aside>

      <main className="login-panel">
        <div className="login-card">
          <div className="login-card__mobile-brand"><BrandMark /></div>

          <header className="login-card__header">
            <h2>Welcome back</h2>
            <p>Sign in to pick up where you left off.</p>
          </header>

          {showSummary && (
            <div
              className="login-alert"
              role="alert"
              tabIndex={-1}
              ref={summaryRef}
              aria-labelledby={`${summaryId}-title`}
            >
              <span className="login-alert__icon"><AlertIcon /></span>
              <div>
                <strong id={`${summaryId}-title`}>There is a problem</strong>
                <p>{notice}</p>
                {fieldErrors.length > 0 && (
                  <ul>
                    {fieldErrors.map(([name, message]) => (
                      <li key={name}>
                        <a href={`#${name === 'email' ? emailId : passwordId}`}>{message}</a>
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </div>
          )}

          {status === 'success' && notice && !showSummary && (
            <p className="login-notice" role="status">{notice}</p>
          )}

          <form className="login-form" onSubmit={handleSubmit} noValidate>
            <div className="login-field">
              <label htmlFor={emailId}>Email address</label>
              <div className="login-input-wrap">
                <span className="login-input-wrap__icon"><MailIcon /></span>
                <input
                  id={emailId}
                  name="email"
                  type="email"
                  inputMode="email"
                  autoComplete="email"
                  placeholder="you@example.com"
                  value={values.email}
                  onChange={(event) => handleChange('email', event.target.value)}
                  onBlur={() => handleBlur('email')}
                  aria-invalid={Boolean(errors.email && touched.email)}
                  aria-describedby={describedBy('email', Boolean(errors.email && touched.email))}
                  required
                />
              </div>
              <p className="login-hint" id={emailHintId}>Use the email you signed up with.</p>
              {errors.email && touched.email && (
                <p className="login-field-error" id={emailErrorId}>{errors.email}</p>
              )}
            </div>

            <div className="login-field">
              <div className="login-field__row">
                <label htmlFor={passwordId}>Password</label>
                <a className="login-link" href="/forgot-password">Forgot password?</a>
              </div>
              <div className="login-input-wrap">
                <span className="login-input-wrap__icon"><LockIcon /></span>
                <input
                  id={passwordId}
                  name="password"
                  type={showPassword ? 'text' : 'password'}
                  autoComplete="current-password"
                  placeholder="At least 8 characters"
                  value={values.password}
                  onChange={(event) => handleChange('password', event.target.value)}
                  onBlur={() => handleBlur('password')}
                  aria-invalid={Boolean(errors.password && touched.password)}
                  aria-describedby={describedBy('password', Boolean(errors.password && touched.password))}
                  required
                />
                <button
                  className="login-reveal"
                  type="button"
                  onClick={() => setShowPassword((current) => !current)}
                  aria-label={showPassword ? 'Hide password' : 'Show password'}
                  aria-pressed={showPassword}
                >
                  {showPassword ? <EyeOffIcon /> : <EyeIcon />}
                </button>
              </div>
              {errors.password && touched.password && (
                <p className="login-field-error" id={passwordErrorId}>{errors.password}</p>
              )}
            </div>

            <label className="login-remember" htmlFor={rememberId}>
              <input
                id={rememberId}
                name="remember"
                type="checkbox"
                checked={remember}
                onChange={(event) => setRemember(event.target.checked)}
              />
              <span>Keep me signed in</span>
            </label>

            <button className="login-submit" type="submit" disabled={status === 'loading'}>
              {status === 'loading' && <span className="login-spinner" aria-hidden="true" />}
              <span>{status === 'loading' ? 'Signing in…' : 'Sign in'}</span>
              {status !== 'loading' && <ArrowIcon />}
            </button>
          </form>

          <div className="login-divider"><span>or continue with</span></div>

          <div className="login-social">
            <button type="button" onClick={() => handleSocial(onGoogleSignIn)} disabled={status === 'loading'}>
              <GoogleIcon />
              <span>Google</span>
            </button>
            <button type="button" onClick={() => handleSocial(onGitHubSignIn)} disabled={status === 'loading'}>
              <GitHubIcon />
              <span>GitHub</span>
            </button>
          </div>

          <p className="login-footer">
            New to Doubtly? <a className="login-link" href="/register">Create an account</a>
          </p>
        </div>
      </main>
    </div>
  )
}
