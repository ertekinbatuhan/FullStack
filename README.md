
<div align="center">

# 📱 iOS Client Application

**Modern SwiftUI Authentication Interface**

[![SwiftUI](https://img.shields.io/badge/SwiftUI-007ACC?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/swiftui/)
[![iOS](https://img.shields.io/badge/iOS-16.0+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![Xcode](https://img.shields.io/badge/Xcode-15.0+-007ACC?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![MVVM](https://img.shields.io/badge/MVVM-Architecture-green?style=for-the-badge)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)

*Native iOS interface built with SwiftUI & MVVM architecture*

[📱 Screenshots](#-screenshots) • [⚡ Features](#-ios-features) • [🚀 Setup](#-ios-setup--installation) • [🏗️ Architecture](#️-ios-project-structure)

</div>

---

## 📋 iOS Overview

The iOS client application is a **modern, native interface** built using **SwiftUI** and follows the **MVVM (Model-View-ViewModel)** architecture pattern. It provides seamless integration with the AuthAPI backend, offering users a smooth and intuitive authentication experience.

### 🎯 Key Highlights

<div align="center">

| 🎨 **Modern Design** | ⚡ **Performance** | 🔒 **Security** | 🛠️ **Development** |
|---------------------|------------------|-----------------|-------------------|
| SwiftUI gradients & animations | Async/await networking | JWT token management | MVVM architecture |
| Responsive layouts | Real-time validation | Secure storage | Clean code structure |
| iOS design guidelines | Progressive loading | Input sanitization | Modular components |

</div>

---

## 📱 Screenshots

<table>
  <tr>
    <th align="center">Sign In Screen</th>
    <th align="center"> Sign Up Screen</th>
    <th align="center">Email Verification Screen</th>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/48d8f426-ce43-475c-99c9-14b6e4e39cbd" width="200" alt="Ekran 3"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/1fd04662-9a0c-4fa9-a4fc-8aca75917f46" width="200" alt="Ekran 4"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/9449688f-d108-4216-aec3-f35e14efc17c" width="200" alt="Ekran 6"/>
    </td>
  </tr>
  <tr>
     <th align="center">Email Verification Screen</th>
     <th align="center">Forgot Password Screen</th>
     <th align="center">Reset Password Screen</th>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/7fc29458-f3a4-4e03-a7fe-450a8cc0750f" width="200" alt="Ekran 1"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/5e0a8cd0-fc25-449b-92c0-e996dd45ff0a" width="200" alt="Ekran 2"/>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/3b2377d2-bcf9-45c0-a49c-d68d5303a576" width="200" alt="Ekran 5"/>
    </td>
  </tr>
</table>

---

### 🛠️ iOS Technology Stack

<div align="center">

| Frontend | Architecture | Network | UI Framework |
|----------|--------------|---------|--------------|
| ![SwiftUI](https://img.shields.io/badge/SwiftUI-007ACC?style=for-the-badge&logo=swift&logoColor=white) | ![MVVM](https://img.shields.io/badge/MVVM-Architecture-green?style=for-the-badge) | ![URLSession](https://img.shields.io/badge/URLSession-Native-blue?style=for-the-badge) | ![Async/Await](https://img.shields.io/badge/Async/Await-Modern-purple?style=for-the-badge) |

</div>

### ✨ iOS Features

| Feature | Description | Status |
|---------|-------------|---------|
| 🔐 **User Authentication** | Login with email and password | ✅ Implemented |
| 👤 **User Registration** | Sign up with email verification | ✅ Implemented |
| 📧 **Email Verification** | Email verification status checking | ✅ Implemented |
| 🔑 **Password Reset** | Forgot password functionality | ✅ Implemented |
| 🎨 **Modern UI** | SwiftUI with gradient backgrounds | ✅ Implemented |
| ⚡ **Async Operations** | Modern async/await networking | ✅ Implemented |
| 🛡️ **Input Validation** | Real-time form validation | ✅ Implemented |
| 🔄 **Loading States** | Progressive loading indicators | ✅ Implemented |

### 🚀 iOS Setup & Installation

#### Prerequisites

- **Xcode 15.0+** - [Download from App Store](https://apps.apple.com/app/xcode/id497799835)
- **iOS 16.0+** - Target deployment
- **macOS Monterey 12.0+** - Development environment

#### 📦 Installation Steps

```bash
# 1. Clone the repository
git clone https://github.com/ertekinbatuhan/mobile-auth-kit
cd FullStack/IOS

# 2. Open Xcode project
open LoginUI.xcodeproj

# 3. Build and run on simulator or device
```

#### ⚙️ Configuration

**API Endpoint Configuration:**

Edit `AuthEndpoint.swift` to point to your API server:

```swift
struct APIConstants {
    // Production (Azure)
    static let baseURL = "https://login-auth-api-azgnaec5ahavgths.westeurope-01.azurewebsites.net/api"
    
    // Local development
    // static let baseURL = "https://localhost:7045/api"
}
```

### 📱 iOS Screens

#### 🔐 Sign In Screen
- Email and password input fields
- Real-time validation
- Loading states during authentication
- Navigation to forgot password

#### 👤 Sign Up Screen
- User registration form
- Password strength validation
- Email format validation
- Navigation to email verification

#### 📧 Email Verification Screen
- Email verification status checking
- Resend verification email
- Real-time status updates

#### 🔑 Forgot Password Screen
- Password reset request
- Email validation
- Success/error feedback

#### 🏠 Home Screen
- Protected content display
- User authentication status
- Welcome message

### 🏗️ iOS Project Structure

```
IOS/LoginUI/
├── LoginUIApp.swift              # Main app entry point
├── View/                         # SwiftUI Views
│   ├── SignIn/                   # Login screens
│   ├── SignUp/                   # Registration screens
│   └── Home/                     # Protected content
├── Models/                       # Data models
├── Network/                      # API communication
├── Core/Service/                 # Authentication service
├── Components/                   # Reusable UI components
└── LoginUITests/                 # Unit tests
    └── LoginUITests.swift        # Test implementations
```

### 🧪 iOS Unit Testing

The iOS application includes comprehensive unit tests to ensure code quality and reliability. The test suite covers both **AuthService** layer and **ViewModel** layer testing with mock implementations.

#### 📊 Test Coverage

| Component | Test Cases | Coverage |
|-----------|------------|----------|
| **AuthService** | 6 test cases | Authentication API calls |
| **SignInViewModel** | 4 test cases | Login flow validation |
| **SignUpViewModel** | 5 test cases | Registration flow validation |
| **Mock Infrastructure** | Full mocking | Network layer abstraction |

#### 🔧 Test Infrastructure

**Mock Components:**
- `MockNetworkManager` - Network layer mocking
- `AuthError` extension - Error comparison support
- Async/await testing - Modern Swift concurrency testing

#### 📝 AuthService Tests

| Test Case | Description | Validation |
|-----------|-------------|------------|
| `testAuthServiceLoginSuccess` | Successful user login | Token validation |
| `testAuthServiceLoginFailure` | Failed login attempt | Error handling |
| `testAuthServiceRegisterSuccess` | Successful registration | Response validation |
| `testAuthServiceForgotPasswordSuccess` | Password reset request | Message validation |
| `testAuthServiceResetPasswordSuccess` | Password reset completion | Success confirmation |
| `testAuthServiceCheckEmailStatusSuccess` | Email status checking | Status validation |

#### 📱 ViewModel Tests

**SignInViewModel Tests:**
- ✅ Successful login flow
- ✅ Failed login with invalid credentials
- ✅ Empty email validation
- ✅ Empty password validation

**SignUpViewModel Tests:**
- ✅ Successful registration flow
- ✅ Password mismatch validation
- ✅ Invalid email format validation
- ✅ Weak password validation
- ✅ Empty email validation

#### 🚀 Running Tests

**Xcode:**
```bash
# Run all tests
Cmd + U

# Run specific test class
Cmd + Control + Option + U
```

**Command Line:**
```bash
# Navigate to iOS project
cd IOS

# Run all tests
xcodebuild test -scheme LoginUI -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'

# Run tests with coverage
xcodebuild test -scheme LoginUI -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' -enableCodeCoverage YES
```

#### 🎯 Test Philosophy

The test suite follows **AAA (Arrange-Act-Assert)** pattern:
- **Arrange:** Set up mock data and dependencies
- **Act:** Execute the function under test
- **Assert:** Verify expected outcomes

**Key Testing Principles:**
- ✅ **Isolation:** Each test is independent
- ✅ **Mocking:** External dependencies are mocked
- ✅ **Async Testing:** Proper async/await testing
- ✅ **Error Scenarios:** Both success and failure paths tested
- ✅ **Validation Logic:** Form validation thoroughly tested

### 🔗 iOS-Backend Integration

The iOS app communicates with the .NET backend through REST API calls:

**Supported Endpoints:**
- `POST /auth/login` - User authentication
- `POST /auth/register` - User registration
- `POST /auth/check-email-status` - Email verification status
- `POST /auth/forgot-password` - Password reset request
- `POST /auth/reset-password` - Password reset completion

---





 
 <div align="center">

# 🔐 AuthAPI

**Modern Email-Based JWT Authentication & Authorization API**

[![.NET 8](https://img.shields.io/badge/.NET-8.0-512BD4?style=flat-square&logo=dotnet)](https://dotnet.microsoft.com/)
[![Entity Framework](https://img.shields.io/badge/Entity%20Framework-8.0-512BD4?style=flat-square)](https://docs.microsoft.com/en-us/ef/)
[![SQLite](https://img.shields.io/badge/SQLite-3.0-003B57?style=flat-square&logo=sqlite)](https://www.sqlite.org/)
[![Azure](https://img.shields.io/badge/Azure-Web%20App-0078D4?style=flat-square&logo=microsoft-azure)](https://azure.microsoft.com/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat-square&logo=docker)](https://www.docker.com/)
[![MailKit](https://img.shields.io/badge/MailKit-SMTP-green?style=flat-square)](https://github.com/jstedfast/MailKit)

*Secure, scalable and modern email-based authentication service*

[Setup](#-quick-setup) • [API Documentation](#-api-endpoints) • [Frontend Integration](#-frontend-integration) • [Deployment](#-deployment)

</div>

---

## 📋 Overview

AuthAPI is an enterprise-ready email-based authentication and authorization service built with .NET 8 and Entity Framework Core. It provides a complete security solution for modern web applications with JWT (JSON Web Token) based security infrastructure.

### ✨ Features

| Feature | Description |
|---------|----------|
| 📧 **Email Authentication** | Email-based user registration and login |
| ✅ **Email Verification** | Mandatory email verification system |
| 🔑 **Password Reset** | Secure password reset system |
| 🔐 **JWT Authentication** | Industry-standard JSON Web Token implementation |
| 🛡️ **Secure Password Hashing** | Secure password hashing with HMACSHA512 |
| 📨 **HTML Email Templates** | Professional-looking email templates |
| 🌐 **CORS Support** | Cross-origin resource sharing support |
| 🗄️ **Entity Framework Core** | Modern ORM for database management |
| ☁️ **Azure Ready** | Optimized for Azure Web App |
| 🐳 **Docker Support** | Container-ready deployment |
| 📦 **Environment-based Config** | Separate configuration for production and development environments |

---

## 🚀 Quick Setup

### Prerequisites

- **.NET 8 SDK** - [Download](https://dotnet.microsoft.com/download/dotnet/8.0)
- **Visual Studio 2022** or **VS Code**
- **Git** - [Download](https://git-scm.com/)
- **Gmail account** - For sending emails

### 📧 Gmail SMTP Setup

1. **Enable 2-Step Verification in your Gmail account**
2. **Create App Password:**
   - Google Account → Security → 2-Step Verification → App passwords
   - Select "Mail" and give a device name
   - Save the generated 16-character password

### 📦 Local Setup

```bash
# Clone the repository
git clone https://github.com/ertekinbatuhan/mobile-auth-kit
cd AuthAPI

# Restore dependencies
dotnet restore

# Copy configuration template
copy appsettings.Example.json appsettings.json

# Edit appsettings.json with your configuration:
# - Update FromEmail and SmtpUsername with your Gmail
# - Generate a strong JWT secret (minimum 32 characters)

# Set Environment Variables (Recommended for security)
set JWT_SECRET=your-super-secret-256-bit-key-minimum-32-characters
set EmailSettings__SmtpPassword=your-16-char-gmail-app-password

# Install Entity Framework tools (if not already installed)
dotnet tool install --global dotnet-ef

# Create database
dotnet ef database update

# Run the application
dotnet run
```

### ⚠️ **IMPORTANT: First Time Setup**

**Before running the application, you MUST:**

1. **Copy configuration file:**
   ```bash
   copy appsettings.Example.json appsettings.json
   ```

2. **Update email addresses in appsettings.json:**
   ```json
   {
     "EmailSettings": {
       "FromEmail": "your-gmail@gmail.com",
       "SmtpUsername": "your-gmail@gmail.com"
     }
   }
   ```

3. **Set required environment variables:**
   ```bash
   # Windows
   set JWT_SECRET=your-super-secret-256-bit-key-minimum-32-characters
   set EmailSettings__SmtpPassword=your-16-char-gmail-app-password

   # Linux/Mac
   export JWT_SECRET=your-super-secret-256-bit-key-minimum-32-characters
   export EmailSettings__SmtpPassword=your-16-char-gmail-app-password
   ```

**🔐 IMPORTANT: JWT Secret Compatibility**

If you're working with a team or want token compatibility with the production API, use the shared JWT secret:

```bash
# Shared JWT Secret (for compatibility with production)
set JWT_SECRET=AuthAPI-Production-Secret-Key-2024-v1-256bit-compatible

# Or generate your own for isolated development:
set JWT_SECRET=your-unique-development-secret-minimum-32-characters
```

⚠️ **Note:** Using the same JWT_SECRET ensures token compatibility between instances. Using different secrets will create incompatible tokens.

**Without these steps, the application will NOT start!**

### 🔧 Configuration Files

| File | Purpose | Git Tracked |
|------|---------|-------------|
| `appsettings.Example.json` | Template for configuration | ✅ Yes |
| `appsettings.json` | Your actual configuration | ❌ No (in .gitignore) |

**Important:** Never commit `appsettings.json` to Git as it contains sensitive information.

### 🌐 Frontend Integration

The API is designed to work with any frontend framework:
- **Base URL:** `https://localhost:7045` (development) or your Azure URL (production)
- **Authentication:** JWT Bearer tokens
- **Content-Type:** `application/json`
- **CORS:** Pre-configured for common development ports

---

## 🔌 API Endpoints

### 📊 Endpoint Overview

| Method | Endpoint | Description | Auth | Status |
|--------|----------|-------------|------|---------|
| `POST` | `/api/auth/register` | User registration with email | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `GET` | `/api/auth/verify-email` | Email verification | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/resend-verification` | Resend verification email | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/login` | User login with email | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/forgot-password` | Send password reset email | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/reset-password` | Set new password | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `GET` | `/api/auth/protected` | Protected data access | ✅ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/check-email-status` | Check email status | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `POST` | `/api/auth/delete-account` | Request account deletion | ✅ | ![Active](https://img.shields.io/badge/status-active-success) |
| `GET` | `/api/auth/confirm-account-deletion` | Confirm account deletion | ❌ | ![Active](https://img.shields.io/badge/status-active-success) |
| `DELETE` | `/api/auth/admin/delete-account/{email}` | Admin account deletion | ✅ | ![Active](https://img.shields.io/badge/status-active-success) |

### 🧪 Health Check Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/health` | System health check |
| `GET` | `/ping` | Keep-alive ping (for free Azure tier) |

### 📝 Example API Usage

<details>
<summary><strong>POST /api/auth/register</strong> - User Registration</summary>

**Request:**
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```

**Password Requirements:**
- 8-50 characters
- At least one uppercase letter
- At least one lowercase letter  
- At least one number
- At least one special character (@$!%*?&)

**Response (201 Created):**
```json
{
  "message": "User registered successfully. Please check your email to verify your account."
}
```

**Error (400 Bad Request):**
```json
{
  "message": "Validation failed.",
  "errors": [
    {
      "Field": "Email",
      "Errors": ["Please enter a valid email address."]
    }
  ]
}
```
</details>

<details>
<summary><strong>POST /api/auth/login</strong> - User Login</summary>

**Request:**
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```

**Response (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9..."
}
```

**Error (400 Bad Request - Unverified Email):**
```json
{
  "message": "Please verify your email address before logging in."
}
```
</details>

<details>
<summary><strong>GET /api/auth/protected</strong> - Protected Endpoint Example</summary>

**Request Headers:**
```
Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json
```

**Response (200 OK):**
```json
{
  "message": "Welcome user@example.com! This is protected data and you are authorized to view it.",
  "timestamp": "2024-01-24T12:00:00Z"
}
```

**Error (401 Unauthorized):**
```json
{
  "message": "Unauthorized"
}
```
</details>

---

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Controllers   │ ──▶│    Services     │ ──▶│   Data Layer    │
│                 │    │                 │    │                 │
│ • AuthController│    │ • IAuthService  │    │ • DataContext   │
│                 │    │ • AuthService   │    │ • Entities      │
│                 │    │ • IEmailService │    │                 │
│                 │    │ • EmailService  │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│      DTOs       │    │   JWT Handler   │    │     SQLite      |
│                 │    │                 │    │                 │
│ • UserForLogin  │    │ • Token Create  │    │ • Users Table   |
│ • UserForRegister│   │ • Token Verify  │    │ • Email Index   |
│ • EmailDto      │    │ • Email Service │    │ • Migrations    |
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🛠️ Technology Stack

<div align="center">

| Backend | Database | Security | Email | DevOps |
|---------|----------|----------|-------|---------|
| ![.NET](https://img.shields.io/badge/.NET_8-512BD4?style=for-the-badge&logo=dotnet&logoColor=white) | ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white) | ![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white) | ![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white) | ![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white) |
| ![ASP.NET Core](https://img.shields.io/badge/ASP.NET_Core-512BD4?style=for-the-badge&logo=dotnet&logoColor=white) | ![Entity Framework](https://img.shields.io/badge/Entity_Framework-512BD4?style=for-the-badge&logo=dotnet&logoColor=white) | ![HMACSHA512](https://img.shields.io/badge/HMACSHA512-FF6B6B?style=for-the-badge) | ![MailKit](https://img.shields.io/badge/MailKit-green?style=for-the-badge) | ![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white) |

</div>

---

## 🔒 Security

### 🛡️ Security Features

- ✅ **Email Verification** required before login
- ✅ **JWT Secret** stored in environment variables
- ✅ **Password Hashing** with HMACSHA512
- ✅ **Token Expiration** for verification and reset tokens
- ✅ **HTTPS** enforced (provided by Azure)
- ✅ **CORS** configurable
- ✅ **Input Validation** with DTOs
- ✅ **Email Enumeration Protection** in forgot password
- ✅ **Environment-based** configuration

### ⚠️ Security Notes

| Topic | Description | Status |
|-------|-------------|---------|
| Email Verification | Email verification required | ✅ Implemented |
| JWT Secret | Should be stored as environment variable | ✅ Implemented |
| Email Validation | Valid email format validation | ✅ Implemented |
| Password Policy | 8-50 chars, upper/lower case, number, special char | ✅ Implemented |
| Token Expiration | 72 hours verification, 1 hour reset | ✅ Implemented |
| Input Validation | DTO validation with data annotations | ✅ Implemented |
| URL Encoding | Automatic URL encoding in email links | ✅ Implemented |
| Rate Limiting | Protection against brute force attacks | 📋 Planned |

---

## ☁️ Deployment

### 🌐 Azure Web App

#### 1️⃣ Set Environment Variables

Azure Portal → Web App → Configuration → Application Settings:

```env
JWT_SECRET=your-super-secure-256-bit-key-here
EmailSettings__SmtpHost=smtp.gmail.com
EmailSettings__SmtpPort=587
EmailSettings__FromName=AuthAPI
EmailSettings__FromEmail=your-gmail@gmail.com
EmailSettings__SmtpUsername=your-gmail@gmail.com
EmailSettings__SmtpPassword=your-16-char-app-password
AppSettings__BaseUrl=https://your-app-name.azurewebsites.net
```

#### 2️⃣ Docker Support

```bash
# Build Docker image
docker build -t authapi .

# Run container
docker run -p 8080:8080 \
  -e JWT_SECRET="your-super-secret-key" \
  -e EmailSettings__FromEmail="your-gmail@gmail.com" \
  -e EmailSettings__SmtpUsername="your-gmail@gmail.com" \
  -e EmailSettings__SmtpPassword="your-app-password" \
  authapi
```

---

## 📧 Email Features

### ✅ **Email Verification Links**
Email links are now **automatically URL encoded** and can be clicked directly!

**Previous problem:** `+` characters were converted to spaces  
**New solution:** Links are encoded with `Uri.EscapeDataString()`

**Example email link:**
```
https://your-app.azurewebsites.net/api/auth/verify-email?token=LrTNAiYw4PvYtMsWzgHfbCszRKb5Ze8STdHqNWCZzKXwQ3FsJBfZ%2B96edyiWcjhd%2FG1E04yK3nEtTXcKk0K%2B8Q%3D%3D
```

This link **works directly in browser** ✅

### 🔑 **Password Reset**
Password reset emails contain both encoded links and raw token information for developers.

---

## 🧪 Testing

### 📊 Test Scenarios

```bash
# 1. User Registration
curl -X POST https://localhost:7045/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "password": "SecurePass123!"}'

# 2. Email Verification (with token from email)
curl -X GET "https://localhost:7045/api/auth/verify-email?token=TOKEN_HERE"

# 3. User Login
curl -X POST https://localhost:7045/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "password": "SecurePass123!"}'

# 4. Protected endpoint access
curl -X GET https://localhost:7045/api/auth/protected \
  -H "Authorization: Bearer YOUR_JWT_TOKEN_HERE"

# 5. Health check
curl -X GET https://localhost:7045/health
```

---

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 🆘 Troubleshooting

<details>
<summary><strong>Email Sending Error</strong></summary>

**Error:** `Failed to send email`

**Solution:**
1. Check that your Gmail App Password is correct
2. Verify that 2-Step Verification is active
3. Ensure environment variables are set correctly
4. Check that your Gmail account allows less secure apps (if using regular password)

</details>

<details>
<summary><strong>Invalid Email Verification Token</strong></summary>

**Error:** `Invalid or expired verification token`

**Solution:**
1. Token must be used within 72 hours
2. Request a new verification email
3. Make sure you copied the entire URL token correctly
4. Check if the email was already verified

</details>

<details>
<summary><strong>JWT Configuration Error</strong></summary>

**Error:** `JWT secret key is not configured`

**Solution:**
1. Set the `JWT_SECRET` environment variable
2. Or add a strong secret to `appsettings.json` (not recommended for production)
3. Ensure the secret is at least 32 characters long

</details>

<details>
<summary><strong>Database Migration Error</strong></summary>

**Error:** Database migration fails

**Solution:**
1. Delete the `auth.db` file if it exists
2. Run `dotnet ef database update` manually
3. Check that Entity Framework tools are installed: `dotnet tool install --global dotnet-ef`

</details>

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**⭐ If you find this project useful, don't forget to give it a star!**

Made with ❤️ and ☕

</div>
