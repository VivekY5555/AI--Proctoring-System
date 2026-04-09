# AI Proctoring System

A full-stack AI-powered exam proctoring system built with **Flask** (backend) and **React/Vite** (frontend).

---

## 🚀 Quick Start

### Option 1 — One Click
Double-click **`START_ALL.bat`** — opens both servers automatically.

### Option 2 — Manual

**Terminal 1 — Backend:**
```bash
cd backend
python app.py
```
Runs at: http://localhost:5000

**Terminal 2 — Frontend:**
```bash
cd frontend
npm run dev
```
Runs at: http://localhost:5173

---

## 🔐 Demo Credentials

| Role    | Email                    | Password   |
|---------|--------------------------|------------|
| Admin   | admin@proctor.com        | admin123   |
| Student | student@proctor.com      | student123 |

---

## 🗄️ Database Schema

```
users              — id, name, email, password_hash, role
exams              — id, title, description, duration, created_by
question_papers    — id, exam_id, title, file_path, answer_key_path
questions          — id, exam_id, question_text, correct_answer
submissions        — id, student_id, exam_id, submitted_at, score
proctor_logs       — id, student_id, exam_id, event_type, timestamp
```

SQLite database auto-created at `backend/proctor.db`

---

## 📡 API Reference

### Auth
| Method | Endpoint         | Description        |
|--------|------------------|--------------------|
| POST   | /auth/register   | Register user      |
| POST   | /auth/login      | Login + get token  |

### Admin (requires admin JWT)
| Method | Endpoint                          | Description              |
|--------|-----------------------------------|--------------------------|
| GET    | /admin/exams                      | List own exams           |
| POST   | /admin/exams                      | Create exam              |
| DELETE | /admin/exams/:id                  | Delete exam              |
| POST   | /admin/upload-paper               | Upload question paper    |
| GET    | /admin/paper/:exam_id             | Get paper (with answers) |
| GET    | /admin/proctor-logs               | All violation logs       |
| GET    | /admin/students                   | All students             |

### Student (requires student JWT)
| Method | Endpoint                | Description              |
|--------|-------------------------|--------------------------|
| GET    | /student/exams          | **All available exams**  |
| GET    | /student/paper/:exam_id | Question paper (no key)  |
| POST   | /student/submit         | Submit exam              |
| POST   | /student/log-event      | Log proctor violation    |

### Proctoring
| Method | Endpoint  | Description              |
|--------|-----------|--------------------------|
| POST   | /detect   | OpenCV face detection    |

---

## 📁 Project Structure

```
├── backend/
│   ├── app.py              # Flask app factory
│   ├── config.py           # Configuration
│   ├── extensions.py       # db, jwt
│   ├── models.py           # SQLAlchemy models
│   ├── auth.py             # Auth routes
│   ├── routes/
│   │   ├── admin.py        # Admin APIs
│   │   ├── student.py      # Student APIs
│   │   └── proctor.py      # Face detection
│   └── uploads/            # PDF files stored here
│
├── frontend/
│   └── src/
│       ├── App.jsx          # Router + providers
│       ├── main.jsx         # Entry point
│       ├── index.css        # Design system
│       ├── context/
│       │   ├── AuthContext.jsx
│       │   └── ToastContext.jsx
│       ├── components/
│       │   └── Navbar.jsx
│       ├── pages/
│       │   ├── LoginPage.jsx
│       │   ├── RegisterPage.jsx
│       │   ├── AdminDashboard.jsx
│       │   ├── CreateExamPage.jsx
│       │   ├── UploadPaperPage.jsx
│       │   ├── ProctorLogsPage.jsx
│       │   ├── StudentDashboard.jsx
│       │   ├── ResultsPage.jsx
│       │   └── LiveProctorPage.jsx
│       └── services/
│           └── api.js       # All API calls
│
├── START_ALL.bat            # Launch both servers
├── start_backend.bat
└── start_frontend.bat
```

---

## ✅ Features

- 🔐 JWT authentication with role-based access (admin / student)
- 📋 Admin can create exams and upload PDF question papers
- 👁️ Live camera proctoring with OpenCV face detection
- 🔔 Real-time alerts: no face, multiple faces, tab switch
- 📄 Students can view question paper PDF during exam
- ⏱️ Countdown timer with auto-submit
- 📊 Proctor violation log for admins
- 🌙 Modern dark-mode UI with glassmorphism design
